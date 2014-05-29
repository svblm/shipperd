require 'test_helper'

class NotificationTest < ActiveSupport::TestCase
  test "assert mention creates notification" do
    comment = comments(:comment)
    assert_difference 'Notification.count' do
      comment.body = "@usErname @nobody"
      comment.save!
    end

    assert comment.body =~ /<del>/, "Body did not strikethrough not found user: #{comment.body}"
  end
end
