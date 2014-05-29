class Notification < ActiveRecord::Base
  enum type: [ :mention, :invite ]
  belongs_to :user
  belongs_to :comment
  belongs_to :sender, class_name: "User", foreign_key: :sender_id

  def read!
    self.read = true
    save!
  end

  def self.new_mention!(sender, recipient, comment_body, comment)
    notification = Notification.new
    notification.mention!
    notification.user = recipient
    notification.save!
  end
end
