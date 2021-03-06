###
# Copyright 2016 - 2020 Green River Data Analysis, LLC
#
# License detail: https://github.com/greenriver/hmis-warehouse/blob/master/LICENSE.md
###

module Reports
  class Hic::OrganizationsController < Hic::BaseController
    def show
      @organizations = organization_scope.joins(:projects).
        merge(GrdaWarehouse::Hud::Project.viewable_by(current_user)).
        merge(GrdaWarehouse::Hud::Project.with_hud_project_type(PROJECT_TYPES)).
        distinct
      respond_to do |format|
        format.html
        format.csv { send_data GrdaWarehouse::Hud::Organization.to_csv(scope: @organizations), filename: "organization-#{Time.now}.csv" }
      end
    end

    def organization_scope
      GrdaWarehouse::Hud::Organization.viewable_by current_user
    end
  end
end
