###
# Copyright 2016 - 2020 Green River Data Analysis, LLC
#
# License detail: https://github.com/greenriver/hmis-warehouse/blob/master/LICENSE.md
###

module CohortColumns
  class HousingManager < CohortString
    attribute :column, String, lazy: true, default: :housing_manager
    attribute :translation_key, String, lazy: true, default: 'Housing Manager'
    attribute :title, String, lazy: true, default: ->(model, _attr) { _(model.translation_key) }
  end
end
