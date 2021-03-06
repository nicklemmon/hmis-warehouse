###
# Copyright 2016 - 2020 Green River Data Analysis, LLC
#
# License detail: https://github.com/greenriver/hmis-warehouse/blob/master/LICENSE.md
###

class GrdaWarehouse::ServiceHistoryService < GrdaWarehouseBase
  include ArelHelper
  include ServiceHistoryServiceConcern

  belongs_to :service_history_enrollment, inverse_of: :service_history_services
  belongs_to :client, class_name: GrdaWarehouse::Hud::Client.name
  has_one :enrollment, through: :service_history_enrollment

  scope :service_between, -> (start_date:, end_date:, service_scope: :current_scope) do
    # FIXME is all the right choice if service_scope returns nil?
    (send(service_scope) || all).
      where(date: start_date..end_date)
  end

  scope :hud_project_type, -> (project_types) do
    in_project_type(project_types)
  end

  scope :permanent_housing, -> do
    in_project_type(GrdaWarehouse::Hud::Project::RESIDENTIAL_PROJECT_TYPES[:ph])
  end

  scope :homeless_sheltered, -> do
    in_project_type(GrdaWarehouse::Hud::Project::HOMELESS_SHELTERED_PROJECT_TYPES)
  end
  scope :homeless_unsheltered, -> do
    in_project_type(GrdaWarehouse::Hud::Project::HOMELESS_UNSHELTERED_PROJECT_TYPES)
  end

  scope :homeless_between, -> (start_date:, end_date:) do
    homeless(chronic_types_only: false).where(date: (start_date..end_date))
end

  scope :literally_homeless_between, -> (start_date:, end_date:) do
    homeless(chronic_types_only: true).where(date: (start_date..end_date))
  end

  scope :youth, -> do
    where(age: (18..24))
  end

  scope :children, -> do
    where(age: (0...18))
  end

  scope :adult, -> do
    where(age: (18..Float::INFINITY))
  end

  def self.project_type_column
    :project_type
  end

  def self.sub_tables
    table_years.map do |year|
      [year, "service_history_services_#{year}"]
    end.reverse.to_h
  end

  def self.remainder_table
    :service_history_services_remainder
  end

  def self.table_years
    (2000..2050)
  end

  def self.parent_table
    :service_history_services
  end

  # schema.rb doesn't include tiggers or functions
  # these need to be active for SHS to work correctly
  def self.ensure_triggers
    return if trigger_exists?

    connection.execute(trigger_sql)
  end

  def self.trigger_sql
    trigger_ifs = []
    sub_tables.each do |year, name|
      constraint = "NEW.date BETWEEN DATE '#{year}-01-01' AND DATE '#{year}-12-31'"
      trigger_ifs << " ( #{constraint} ) THEN
            INSERT INTO #{name} VALUES (NEW.*);
        "
    end

    trigger = "
      CREATE OR REPLACE FUNCTION #{trigger_name}()
      RETURNS TRIGGER AS $$
      BEGIN
      IF "
    trigger += trigger_ifs.join(' ELSIF ');
    trigger += "
      ELSE
        INSERT INTO #{remainder_table} VALUES (NEW.*);
        END IF;
        RETURN NULL;
    END;
    $$
    LANGUAGE plpgsql;
    CREATE TRIGGER #{trigger_name}
    BEFORE INSERT ON #{parent_table}
    FOR EACH ROW EXECUTE PROCEDURE #{trigger_name}();
    "
  end

  def self.trigger_name
    'service_history_service_insert_trigger'
  end

  def self.trigger_exists?
    query = "select count(*) from information_schema.triggers where trigger_name = '#{trigger_name}'"
    result = connection.execute(query).first
    return result['count'].positive?
  end
end