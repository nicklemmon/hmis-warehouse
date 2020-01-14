class SetDefaultAharConfig < ActiveRecord::Migration[4.2]
  def up
    GrdaWarehouse::Config.invalidate_cache
    GrdaWarehouse::Config.first.update(ahar_psh_includes_rrh: true)
  end
end
