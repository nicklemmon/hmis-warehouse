class AddLiteralHomelessDaysToProcessedClients < ActiveRecord::Migration[4.2]
  def change
    add_column :warehouse_clients_processed, :literally_homeless_last_three_years, :integer
  end
end
