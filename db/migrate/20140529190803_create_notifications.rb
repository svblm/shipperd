class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.integer :event
      t.boolean :read, default: false
      t.string :message
      t.string :url
      t.references :user
      t.references :sender

      t.timestamps
    end
  end
end
