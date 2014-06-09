class Invite < ActiveRecord::Base
  enum state: [ :pending, :accepted, :rejected ]
  belongs_to :user
  belongs_to :sender, class_name: "User", foreign_key: :sender_id
  belongs_to :project
  after_create :notify

  scope :pending,  -> { where( state: 0 ) }
  scope :accepted, -> { where( state: 1 ) }
  scope :rejected, -> { where( state: 2 ) }

  def accept!
    accepted!
    project.users.add(user)
    project.save!
    save!
  end

  def reject!
    rejected!
    save!
  end

  def notify
    Notification.new_invite! sender, user, self
  end
end
