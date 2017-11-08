module GrdaWarehouse::Tasks
  class HudChronicallyHomeless

    # 1. clients = all clients with an open enrollment in a homeless project
    # 2. client.hud_chronic? Date.today => save to hud_chronics

    attr_accessor :date, :client_ids, :total

    def initialize date: Date.today, client_ids: []
      @date = date
      @client_ids = client_ids
      @total = 0
    end

    def run!
      # turn off SQL logging
      ActiveRecord::Base.logger.level = 1
      log "\nCalculating HUD Chronically Homeless for #{client_ids.size} clients on #{@date}", underline: true
      GrdaWarehouse::HudChronic.transaction do
        GrdaWarehouse::HudChronic.where(date: @date).delete_all
        client_ids.each_with_index do |id, index|
          client = GrdaWarehouse::Hud::Client.where( id: id ).first
          next unless client && client.hud_chronic?(on_date: @date)

          log " #{index} => Client #{id} is HUD chronic"

          data = client.hud_chronic_data

          hc = GrdaWarehouse::HudChronic.new
          hc.date = @date
          hc.client_id = id
          hc.days_in_last_three_years = nil
          hc.months_in_last_three_years = data[:months_in_last_three_years]
          hc.individual = !client.presented_with_family?(after: @date - 3.years, before: @date)
          hc.age = client.age_on(@date)
          hc.homeless_since = client.service_history.first_date&.first.try(:date)
          hc.dmh = any_dmh_for?(client_id: id)
          hc.trigger = data[:trigger]
          hc.project_names = nil

          hc.save
          self.total += 1
        end
      end

      log "\nCreated #{total} records for clients found to be HUD Chronic"

      # turn on SQL logging
      ActiveRecord::Base.logger.level = 0
    end

    def client_ids
      return @client_ids if @client_ids&.any?
      GrdaWarehouse::ServiceHistory.hud_currently_homeless(date: @date).distinct.pluck(:client_id)
    end

    def any_dmh_for? client_id:
      @dmh_ids ||= GrdaWarehouse::Hud::Organization.dmh.ids
      GrdaWarehouse::ServiceHistory.ongoing(on_date: @date).where(client_id: client_id, organization_id: @dmh_ids).any?
    end

    def log msg, underline: false
      return unless Rails.env.development?
      Rails.logger.info msg
      Rails.logger.info "="*msg.length if underline
    end
    
  end
end