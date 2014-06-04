class AddsExperimentalBooleanToAssets < ActiveRecord::Migration
  def change
    add_column :assets, :experimental, :boolean, default: false
  end
end
