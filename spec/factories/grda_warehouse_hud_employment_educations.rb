FactoryBot.define do
  factory :hud_employment_education, class: 'GrdaWarehouse::Hud::EmploymentEducation' do
    sequence(:EmploymentEducationID, 7)
    sequence(:EnrollmentID, 1)
    sequence(:PersonalID, 10)
  end
end
