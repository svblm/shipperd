require 'test_helper'

class ProjectTest < ActiveSupport::TestCase
  test "url validation for homepage" do
    assert_difference ['Project.count'] do
      Project.create(
        name: 'test',
        description: 'desc',
        homepage: 'http://example.com'
      )
    end

    assert_no_difference 'Project.count' do
      Project.create(
        name: 'no good',
        description: 'horrible',
        homepage: 'ftp:/ wow .coms'
      )
    end
  end
end
