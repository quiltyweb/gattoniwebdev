require "test_helper"

class LandingFlowTest < ActionDispatch::IntegrationTest
 
  # https://guides.rubyonrails.org/v8.0.0/testing.html#integration-testing
  test "can see the welcome page" do
    get "/"
    assert_dom "h1", "Web design & development with Accessibility in mind."
    assert_dom "h2", "Our Core Services"
    assert_dom "h2", "Our Latest Project"
    assert_dom "h2", "Our Team"
    assert_dom "h2", "Contact Us"
  end 
end
