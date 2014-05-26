require 'test_helper'

class AssetTest < ActiveSupport::TestCase
  test "assets should belong to projects" do
    assert_difference 'projects(:lean).assets.count' do
      projects(:lean).assets << Asset.create!(name: "Testo")
      projects(:lean).save!
    end
  end

  test "should have enum" do
    assert assets(:asset).staged?, "Enum was wrong, should have been staged, was: #{assets(:asset).state}"
  end
end
