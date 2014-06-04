require 'test_helper'

class UserTest < ActiveSupport::TestCase
   test "user should have password" do
    assert_difference 'User.count' do
      User.create(
        email: 'JakeCataford@gmail.com',
        username: 'JakeCataford',
        password: 'password',
        password_confirmation: 'password'
      )
    end
  end

  test 'should HABTM projects' do
    assert_difference 'users(:user).projects.count' do
      users(:user).projects << projects(:lean)
      users(:user).save!
    end
  end

  test 'should have owned_projects' do
    users(:user).owned_projects.push projects(:lean)
    assert users(:user).save
  end
end
