require "test_helper"

class LandingControllerTest < ActionDispatch::IntegrationTest

  # https://guides.rubyonrails.org/testing.html#functional-testing-for-controllers
  
  test "should get home" do
    get landing_home_path
    # binding.pry
    assert_response :success
  end

  test "should get accessibility_statement" do
    get landing_accessibility_statement_path
    assert_response :success
  end
end
