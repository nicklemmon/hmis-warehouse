###
# Copyright 2016 - 2019 Green River Data Analysis, LLC
#
# License detail: https://github.com/greenriver/hmis-warehouse/blob/master/LICENSE.md
###

module SimilarityMetric
  class MiddleName < SimilarityMetric::Levenshtein
    include NameDataQuality
    
    def field
      :MiddleName
    end
  end
end