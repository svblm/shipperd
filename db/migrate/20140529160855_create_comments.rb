class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :body
      t.integer :revision
      t.references :commenter
      t.references :asset
      t.timestamps
    end
  end
end
