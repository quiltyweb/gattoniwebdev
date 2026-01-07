require "test_helper"

class LandingControllerTest < ActionDispatch::IntegrationTest

  # https://guides.rubyonrails.org/testing.html#functional-testing-for-controllers
  
  test "should get home" do
    get landing_home_path
    # binding.pry
    assert_response :success
  end

  test "should get about path" do
    get landing_about_path
    assert_response :success
  end

  test "should get projects path" do
    get landing_projects_path
    assert_response :success
  end

  test "should get contact path" do
    get landing_contact_us_path
    assert_response :success
  end 
end
