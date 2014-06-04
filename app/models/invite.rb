class Invite < ActiveRecord::Base
  enum state: [ :pending, :accepted, :rejected ]
  belongs_to :user
  belongs_to :sender, class_name: "User", foreign_key: :sender_id
  belongs_to :project

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
end
