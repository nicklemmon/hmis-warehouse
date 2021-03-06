require 'rails_helper'
require 'models/exporters/hmis_twenty_twenty/project_setup.rb'
require 'models/exporters/hmis_twenty_twenty/enrollment_dates_setup.rb'
require 'models/exporters/hmis_twenty_twenty/multi_enrollment_tests.rb'

def project_test_type
  'enrollment date-based'
end

RSpec.describe Exporters::HmisTwentyTwenty::Base, type: :model do
  include_context '2020 project setup'
  include_context '2020 enrollment dates setup'

  let(:involved_project_ids) { projects.map(&:id) }
  let(:exporter) do
    Exporters::HmisTwentyTwenty::Base.new(
      start_date: 3.weeks.ago.to_date,
      end_date: 1.weeks.ago.to_date,
      projects: involved_project_ids,
      period_type: 3,
      directive: 3,
      user_id: user.id,
    )
  end

  include_context '2020 multi-enrollment tests'
end
