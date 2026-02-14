require "test_helper"

class SiteSettingTest < ActiveSupport::TestCase
  test "get and set methods work" do
    SiteSetting.set("test_key", "test_value")
    assert_equal "test_value", SiteSetting.get("test_key")
  end

  test "set updates existing setting" do
    SiteSetting.set("test_key", "value1")
    SiteSetting.set("test_key", "value2")
    assert_equal "value2", SiteSetting.get("test_key")
    assert_equal 1, SiteSetting.where(key: "test_key").count
  end

  test "get returns nil for missing key" do
    assert_nil SiteSetting.get("nonexistent")
  end
end
