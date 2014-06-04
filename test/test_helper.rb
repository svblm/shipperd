ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  #
  # Note: You'll currently still have to declare fixtures explicitly in integration tests
  # -- they do not yet inherit this setting
  fixtures :all

  def setup
    unless @controller.nil?
      @controller.stubs(:current_user).returns(users(:user))
    end
    @dropbox_mock = stub_everything
    files = []
    files.push "path" => "path/to/file.txt"
    files.push "path" => "path/to/picture.png"
    files.push "path" => "path/to/_thumb.jpg"
    @dropbox_mock.stubs(:metadata).returns "contents" => files
    @dropbox_mock.stubs(:media).returns "http://url-media.com"
    DropboxClient.stubs(:new).returns(@dropbox_mock)
  end
  # Add more helper methods to be used by all tests here...
end
