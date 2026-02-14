require "test_helper"

class AdminTest < ActionDispatch::IntegrationTest
  setup do
    @admin = AdminUser.create!(email: "test@example.com", password: "password", password_confirmation: "password")
  end

  test "login page renders" do
    get admin_login_path
    assert_response :success
  end

  test "can log in with valid credentials" do
    post admin_login_path, params: { email: "test@example.com", password: "password" }
    assert_redirected_to admin_dashboard_path
    follow_redirect!
    assert_response :success
  end

  test "rejects invalid credentials" do
    post admin_login_path, params: { email: "test@example.com", password: "wrong" }
    assert_response :unprocessable_entity
  end

  test "dashboard requires authentication" do
    get admin_dashboard_path
    assert_redirected_to admin_login_path
  end
end
