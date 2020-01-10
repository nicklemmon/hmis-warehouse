###
# Copyright 2016 - 2020 Green River Data Analysis, LLC
#
# License detail: https://github.com/greenriver/hmis-warehouse/blob/master/LICENSE.md
###

module WarehouseReports::Health
  class EncountersController < ApplicationController
    include WarehouseReportAuthorization

    before_action :require_can_administer_health!
    before_action :set_report, only: [:destroy, :show]
    before_action :set_report_range, except: [:destroy]

    def index
      @reports = Health::EncounterReport.order(created_at: :desc)
    end

    def create
      report = Health::EncounterReport.create(start_date: @start_date, end_date: @end_date)
      report.populate!
      redirect_to action: :index
    end

    def destroy
      @report.destroy
      redirect_to action: :index
    end

    def show
      @encounters = Health::EncounterRecord.where(encounter_report: @report)
      respond_to do |format|
        format.xlsx do
          headers['Content-Disposition'] = "attachment; filename=\"encounters-#{@start_date} to #{@end_date}.xlsx\""
        end
      end
    end

    private def report_params
      params.permit(filter: [:start, :end])
    end

    private def set_report_range
      @start_date = report_params[:filter].try(:[], :start)&.to_date || Date.current.last_year.beginning_of_year
      @end_date = report_params[:filter].try(:[], :start) &.to_date || Date.current.last_year.end_of_year
    end

    private def set_report
      @report = Health::EncounterReport.find(params[:id].to_i)
    end
  end
end
