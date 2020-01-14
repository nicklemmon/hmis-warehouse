class AddCanEditWarehouseAlertsPermission < ActiveRecord::Migration[4.2]
  def up
    Role.ensure_permissions_exist
    Role.reset_column_information
  end
  def down
    remove_column :roles, :can_edit_warehouse_alerts, :boolean, default: false
  end
end
