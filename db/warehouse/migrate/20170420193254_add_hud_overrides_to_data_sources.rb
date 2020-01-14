class AddHudOverridesToDataSources < ActiveRecord::Migration[4.2]
  def change
    add_column :ProjectCoC, :hud_coc_code, :string
    add_column :Project, :hud_continuum_funded, :boolean
  end
end
