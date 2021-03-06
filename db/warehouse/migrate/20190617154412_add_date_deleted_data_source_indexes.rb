class AddDateDeletedDataSourceIndexes < ActiveRecord::Migration[4.2]
  def change
    add_index :Affiliation, [:DateDeleted, :data_source_id]
    add_index :Client, [:DateDeleted, :data_source_id]
    add_index :Disabilities, [:DateDeleted, :data_source_id]
    add_index :EmploymentEducation, [:DateDeleted, :data_source_id]
    add_index :Enrollment, [:DateDeleted, :data_source_id]
    add_index :EnrollmentCoC, [:DateDeleted, :data_source_id]
    add_index :Exit, [:DateDeleted, :data_source_id]
    add_index :Funder, [:DateDeleted, :data_source_id]
    add_index :Geography, [:DateDeleted, :data_source_id]
    add_index :HealthAndDV, [:DateDeleted, :data_source_id]
    add_index :IncomeBenefits, [:DateDeleted, :data_source_id]
    add_index :Inventory, [:DateDeleted, :data_source_id]
    add_index :Organization, [:DateDeleted, :data_source_id]
    add_index :Project, [:DateDeleted, :data_source_id]
    add_index :ProjectCoC, [:DateDeleted, :data_source_id]
    add_index :Services, [:DateDeleted, :data_source_id]
  end
end
