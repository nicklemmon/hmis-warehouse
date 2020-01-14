class RecreateServiceHistoryServiceIndex < ActiveRecord::Migration[4.2]
  def change
    add_index :service_history_services, :date, name: :index_shs_date, :using=>:brin
    remove_index :service_history_services, name: :index_shs_date_en_id
  end
end
