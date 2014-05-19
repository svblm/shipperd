class CreateAssets < ActiveRecord::Migration
  def change
    create_table :assets do |t|
      t.string :name
      t.belongs_to :project
      t.integer :state, default: 0

      t.timestamps
    end
  end
end
