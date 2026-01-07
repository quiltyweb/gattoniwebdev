require "test_helper"

class LandingFlowTest < ActionDispatch::IntegrationTest
 
  # https://guides.rubyonrails.org/v8.0.0/testing.html#integration-testing
  test "can see the welcome page" do
    get "/"
    assert_dom "h1", "Work in Progress!"
  end

  test "can see the about page" do
    get "/landing/about"
    assert_dom "h1", "About us"
  end

  test "can see the projects page" do
    get "/landing/projects"
    assert_dom "h1", "Projects"
  end

  test "can see the contact us page" do
    get "/landing/contact_us"
    assert_dom "h1", "Contact us"
  end
 end
