class AddCollegeQuestionsToYouthIntake < ActiveRecord::Migration[4.2]
  def change
    add_column :youth_intakes, :college_pilot, :string, null: false, default: 'No'
    add_column :youth_intakes, :graduating_college, :string, null: false, default: 'No'
  end
end