###
# Copyright 2016 - 2019 Green River Data Analysis, LLC
#
# License detail: https://github.com/greenriver/hmis-warehouse/blob/master/LICENSE.md
###

module Dashboards
  class BaseController < ApplicationController
    include ArelHelper

    CACHE_EXPIRY = if Rails.env.production? then 8.hours else 20.seconds end

    before_action :require_can_view_censuses!
    before_action :set_available_months
    before_action :set_chosen_months
    before_action :set_report_months
    before_action :set_project_types
    before_action :set_project_and_organization_ids
    before_action :set_start_date
    before_action :set_end_date
    before_action :set_limit_to_vispdat

    def index
      @report = active_report_class.new(months: @report_months, organization_ids: @organization_ids, project_ids: @project_ids, project_types: @project_type_codes, filter: { vispdat: @limit_to_vispdat })

      respond_to do |format|
        format.html do
          @html = true
        end
        format.xlsx do
          require_can_view_clients!
          @enrollments = @report.enrolled_clients
          @clients = GrdaWarehouse::Hud::Client.where(
            id: @enrollments.distinct.pluck(:client_id)
          ).index_by(&:id)
          @projects = GrdaWarehouse::Hud::Project.where(
            id: @enrollments.distinct.pluck(:project_id)
          ).pluck(:id, :ProjectName).to_h
           @organizations = GrdaWarehouse::Hud::Organization.where(
            id: @enrollments.distinct.pluck(:organization_id)
          ).pluck(:id, :OrganizationName).to_h
        end
        format.pdf do
          file_name = "#{@report.sub_population_title} Dashboard"
          render pdf: file_name,
            layout: 'pdf',
            page_size: 'Letter',
            javascript_delay: 20,
            show_as_html: true
          #
          # pdf = dashboard_pdf(file_name)

          # send_data dashboard_pdf.to_pdf, filename: "#{file_name}.pdf", type: "application/pdf"
        end
      end
    end

    def dashboard_pdf file_name
      render_to_string(
        pdf: file_name,
        template: 'dashboards/index',
        # layout: false,
        encoding: "UTF-8",
        page_size: 'Letter',
        # header: { html: { template: 'window/health/careplans/_pdf_header' }, spacing: 1 },
        # footer: { html: { template: 'window/health/careplans/_pdf_footer'}, spacing: 5 },
        # Show table of contents by providing the 'toc' property
        # toc: {}
      )
    end

    def describe_computations
      path = "app/views/dashboards/base/README.md"
      description = File.read(path)
      markdown = Redcarpet::Markdown.new(::TranslatedHtml)
      markdown.render(description)
    end
    helper_method :describe_computations

    def set_available_months
      @available_months ||= active_report_class.distinct.order(year: :desc, month: :desc).
        pluck(:year, :month).map do |year, month|
          date = Date.new(year, month, 1)
          [[year, month], date.strftime('%B %Y')]
        end.to_h
    end

    # to_i.to_s to ensure end result is an integer
    def set_chosen_months
      @start_month = JSON.parse(params[:choose_report][:start_month]).map(&:to_i).to_s rescue [6.months.ago.year, 6.months.ago.month].to_s
      @end_month = JSON.parse(params[:choose_report][:end_month]).map(&:to_i).to_s rescue [1.months.ago.year, 1.months.ago.month].to_s
    end

    def set_report_months
      all_months_array = @available_months.keys
      start_index = all_months_array.index(JSON.parse(@start_month))
      end_index = all_months_array.index(JSON.parse(@end_month))
      @report_months = all_months_array[end_index..start_index] rescue []
    end

    def set_start_date
      (year, month) = @report_months.last
      @start_date = Date.new(year, month, 1) rescue Date.today
    end

    def set_end_date
      (year, month) = @report_months.first
      @end_date = Date.new(year, month, -1) rescue Date.today
    end

    def set_project_and_organization_ids
      @organization_ids = params[:choose_report][:organization_ids].map(&:presence).compact.map(&:to_i) rescue []
      @project_ids = params[:choose_report][:project_ids].map(&:presence).compact.map(&:to_i) rescue []
    end

    def set_project_types
      @project_type_codes = GrdaWarehouse::Hud::Project::HOMELESS_TYPE_TITLES.keys
      if params.try(:[], :choose_report).try(:[], :project_types).present?
         @project_type_codes = params.try(:[], :choose_report).try(:[], :project_types).
          select(&:present?).
          map(&:to_sym).
          select{|m| m.in?(GrdaWarehouse::Hud::Project::HOMELESS_TYPE_TITLES.keys)}
      end
    end

    def vispdat_limits
      {
        'All clients' => :all_clients,
        'Only clients with VI-SPDATs' => :with_vispdat,
        'Only clients without VI-SPDATs' => :without_vispdat,
      }
    end
    helper_method :vispdat_limits

    def set_limit_to_vispdat
      # Whitelist values
      @limit_to_vispdat = vispdat_limits.values.detect do |v|
        v == params[:choose_report][:limit_to_vispdat].to_sym
      end rescue :all_clients
    end

  end
end