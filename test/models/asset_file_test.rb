require 'test_helper'

class AssetFileTest < ActiveSupport::TestCase
  test "asset should have files" do
    assert_equal assets(:asset).files.count, 2
  end

  test "asset files should have correct extension and filename" do
    file = assets(:asset).files.first
    assert_equal file.filename, "file"
    assert_equal file.extension, ".txt"
  end

  test "asset should have thumbnail" do
    assert_equal assets(:asset).thumbnail.filename, "_thumb"
  end
end

