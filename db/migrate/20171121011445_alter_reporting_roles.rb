class AlterReportingRoles < ActiveRecord::Migration[4.2]
  def up
    if column_exists? :roles, :can_view_reports
      remove_column :roles, :can_view_reports, :boolean, default: false
    end
    Role.ensure_permissions_exist
    Role.reset_column_information
  end
  def down
    add_column :roles, :can_view_reports, :boolean, default: false
    remove_column :roles, :can_view_all_reports, :boolean, default: false
    remove_column :roles, :can_assign_reports, :boolean, default: false
  end
end
