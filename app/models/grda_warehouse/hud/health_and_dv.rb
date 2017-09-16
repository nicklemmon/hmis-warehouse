# health and domestic violence
module GrdaWarehouse::Hud
  class HealthAndDv < Base
    self.table_name = 'HealthAndDV'
    self.hud_key = 'HealthAndDVID'
    acts_as_paranoid column: :DateDeleted

    def self.hud_csv_headers(version: nil)
      [
        "HealthAndDVID",
        "ProjectEntryID",
        "PersonalID",
        "InformationDate",
        "DomesticViolenceVictim",
        "WhenOccurred",
        "CurrentlyFleeing",
        "GeneralHealthStatus",
        "DentalHealthStatus",
        "MentalHealthStatus",
        "PregnancyStatus",
        "DueDate",
        "DataCollectionStage",
        "DateCreated",
        "DateUpdated",
        "UserID",
        "DateDeleted",
        "ExportID"
      ]
    end

    belongs_to :client, class_name: 'GrdaWarehouse::Hud::Client', foreign_key: [:PersonalID, :data_source_id], primary_key: [:PersonalID, :data_source_id], inverse_of: :health_and_dvs
    belongs_to :enrollment, class_name: GrdaWarehouse::Hud::Enrollment.name, primary_key: [:ProjectEntryID, :PersonalID, :data_source_id], foreign_key: [:ProjectEntryID, :PersonalID, :data_source_id], inverse_of: :health_and_dvs
    has_one :project, through: :enrollment
    belongs_to :export, **hud_belongs(Export), inverse_of: :health_and_dvs
    has_one :destination_client, through: :client

  end
end