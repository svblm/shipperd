require 'test_helper'

class InviteTest < ActiveSupport::TestCase
  test 'invitation creates notification' do
    assert_difference 'users(:no_project).notifications.unread.count' do
      Invite.create! sender: users(:user),
                     user: users(:no_project),
                     project: projects(:lean)
    end
  end
end
