class NonHmisUploadsController < ApplicationController

  before_action :require_can_upload_dashboard_extras!
  before_action :set_data_source

  def index
    attributes = GrdaWarehouse::NonHmisUpload.column_names - ['import_errors', 'content']
    @uploads = upload_source.select(*attributes).
      where(data_source_id: @data_source.id)
      .page(params[:page].to_i).per(20).order(created_at: :desc)
  end

  def new
    @upload = upload_source.new
  end

  def create
    run_import = false
    # Prevent create if user forgot to include file
    if !upload_params[:file]
      @upload = upload_source.new
      flash[:alert] = _("You must attach a file in the form.")
      render :new
      return
    end
    file = upload_params[:file]
    @upload = upload_source.new(upload_params.merge({
      percent_complete: 0.0,
      data_source_id: @data_source.id,
      user_id: current_user.id,
      content_type: file.content_type,
      content: file.read,
    }))
    if @upload.save
      run_import = true
      flash[:notice] = _("Upload queued to start.")
      redirect_to action: :index
    else
      flash[:alert] = _("Upload failed to queue, did you attach a file?")
      render :new
    end
    if run_import
      job = Delayed::Job.enqueue Importing::NonHmisJob.new(upload: @upload, data_source_id: @upload.data_source_id)
      @upload.update(delayed_job_id: job.id)
    end
  end

  private

  def upload_params
    params.require(:grda_warehouse_non_hmis_upload).
      permit(:file, :file_cache)
  end

  def data_source_source
    GrdaWarehouse::DataSource.viewable_by current_user
  end

  def upload_source
    GrdaWarehouse::NonHmisUpload
  end

  def set_data_source
    @data_source = data_source_source.find(params[:data_source_id].to_i)
  end

  def upload_source
    GrdaWarehouse::NonHmisUpload
  end

end