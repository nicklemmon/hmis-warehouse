class BaseJob < ActiveJob::Base
  STARTING_PATH = File.realpath(FileUtils.pwd)
  include NotifierConfig

  # When called through Active::Job, uses this hook
  before_perform do |job|
    if STARTING_PATH != expected_path || ! File.exists?('config/exception_notifier.yml')
      if File.exists?('config/exception_notifier.yml')
        msg = "Started dir is `#{STARTING_PATH}`\nCurrent dir is `#{expected_path}`\nExiting in order to let systemd restart me in the correct directory."
        notify_on_restart(msg)
        if job.respond_to? :job_id
          unlock_job!(job.job_id)
        end
      end
      
      # Exit, ignoring signal handlers which would prevent the process from dying
      exit!(0)
    end
  end
  # when queued with perform_later (active job, this gets used)
  # This works in both situations
  rescue_from Exception do |e|
    notify_on_exception(e)
  end

  # When called through Delayed::Job, uses this hook
  def before job
    if STARTING_PATH != expected_path || ! File.exists?('config/exception_notifier.yml')
      job = self unless job.respond_to? :locked_by
      File.exists?('config/exception_notifier.yml')
        msg = "Started dir is `#{STARTING_PATH}`\nCurrent dir is `#{expected_path}`\nExiting in order to let systemd restart me in the correct directory."
        notify_on_restart(msg)
        unlock_job!(job.id)
      end
      
      # Exit, ignoring signal handlers which would prevent the process from dying
      exit!(0)
    end
  end
  # when queued with Delayed::Job.enqueue TestJob.new (this gets used)
  # This will send two notifications for each error, probably
  def error(job, e)
    notify_on_exception(e)
  end

  private

  def notify_on_restart msg
    Rails.logger.info msg
    setup_notifier('DelayedJobRestarter')
    @notifier.ping(msg) if @send_notifications
  end

  def notify_on_exception exception
    setup_notifier('DelayedJobFailure')
    msg = "*#{self.class.name}* `FAILED` with the following error: \n ```#{exception.inspect}```"
    @notifier.ping(msg) if @send_notifications
  end

  def expected_path
    Rails.cache.fetch('deploy-dir') do
      # A default for the first deployment and local development
      # This should be set on deployment.
      Delayed::Worker::Deployment.deployed_to
    end
  end

  def unlock_job!(job_id)
    a_t = Delayed::Job.arel_table
    job_object = Delayed::Job.where(a_t[:handler].matches("%job_id: #{job_id}%").or(a_t[:id].eq(job_id))).first
    if job_object
      msg = "Restarting stale delayed job: #{job_object.locked_by}"
      notify_on_restart(msg)

      job_object.update_attributes(locked_by: nil, locked_at: nil) 
    end
  end
end
