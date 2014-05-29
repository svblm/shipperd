class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.integer :type
      t.boolean :read, default: false
      t.string :message
      t.string :url
      t.references :user
      t.references :sender
      t.references :comment

      t.timestamps
    end
  end
end
