###
# Copyright 2016 - 2019 Green River Data Analysis, LLC
#
# License detail: https://github.com/greenriver/hmis-warehouse/blob/master/LICENSE.md
###

module WarehouseReports::Health
  class HousingStatusController < ApplicationController
    before_action :require_can_administer_health!

    def index
      @end_date = params.dig(:filter, :end_date) || Date.today
      @start_date = params.dig(:filter, :start_date) || @end_date - 1.month
      @aco = params.dig(:filter, :aco)&.select{|id| id.present? }

      if @start_date.to_date > @end_date.to_date
        new_start = @end_date
        @end_date = @start_date
        @start_date = new_start
      end

      @report = WarehouseReport::Health::HousingStatus.new(@start_date, @end_date, @aco)
    end
  end
end