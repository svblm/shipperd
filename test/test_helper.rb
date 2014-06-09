ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  fixtures :all

  def setup

    @controller.session[:user_id] = users(:user).id unless @controller.nil?
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
