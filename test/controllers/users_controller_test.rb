require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  test "should get show" do
    get :show, id: users(:user)
    assert_response :success
  end

  test "should post create" do
    assert_difference 'User.count' do
      post :create, user: {username: 'test', password: 'testo', password_confirmation: 'testo', email: 'a@a.com'}
      assert_response :redirect
    end
  end
end
