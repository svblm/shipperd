class AddsRevisionNumberToAssets < ActiveRecord::Migration
  def change
    add_column :assets, :revision, :integer, default: 0
  end
end
