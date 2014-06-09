require 'test_helper'

class InvitationsControllerTest < ActionController::TestCase
  test "should accept invitation" do
    assert_difference "projects(:lean).users.count" do
      get :accept, { project_id: projects(:lean), id: invites(:pending).id }
    end
  end
end
