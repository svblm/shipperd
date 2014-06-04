class CreateInvites < ActiveRecord::Migration
  def change
    create_table :invites do |t|
      t.references :user
      t.references :project
      t.references :sender
      t.integer :state

      t.timestamps
    end
  end
end
