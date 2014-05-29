require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  test "should create and parse comment" do
    comment = Comment.new
    comment.asset = assets(:asset)
    comment.commenter = users(:user)
    comment.body = "*markdown*"
    comment.save!
    assert_equal comment.revision, 1
    assert comment.body =~ /<em>/i, "Comment body was not parsed, #{comment.body}"
  end

  test "out of date comments" do
    assert_equal comments(:out_of_date_comment).out_of_date?, true
    assert_equal comments(:comment).out_of_date?, false
  end
end
