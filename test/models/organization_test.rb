require 'test_helper'

class OrganizationTest < ActiveSupport::TestCase
  test "should not save without title" do
    organization = Organization.new
    assert_not organization.save
  end

  test "should not allow empty title" do
    organization = Organization.new
    organization.update(title: "123")
    assert_not organization.save
  end
end
