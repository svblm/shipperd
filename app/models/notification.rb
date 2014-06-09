class Notification < ActiveRecord::Base
  enum event: [ :mention, :invite ]
  belongs_to :user
  belongs_to :sender, class_name: "User", foreign_key: :sender_id
  scope :unread, -> { where(read: false) }
  def read!
    self.read = true
    save!
  end

  def self.new_mention!(sender, recipient, comment)
    notification = Notification.new
    notification.mention!
    notification.user = recipient
    notification.sender = sender
    notification.url = Rails.application.routes.url_helpers.project_asset_path(comment.asset.project, comment.asset)
    notification.save!
  end

  def self.new_invite!(sender, recipient, invite)
    notification = Notification.new
    notification.invite!
    notification.user = recipient
    notification.sender = sender
    notification.url = Rails.application.routes.url_helpers.accept_project_invitation_path(invite.project, invite)
    notification.save!
  end
end
