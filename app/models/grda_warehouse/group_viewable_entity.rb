###
# Copyright 2016 - 2019 Green River Data Analysis, LLC
#
# License detail: https://github.com/greenriver/hmis-warehouse/blob/master/LICENSE.md
###

module GrdaWarehouse
  class GroupViewableEntity < GrdaWarehouseBase
    # acts_as_paranoid

    belongs_to :access_group
    belongs_to :entity, polymorphic: true
  end
end