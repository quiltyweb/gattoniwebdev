require "test_helper"

class ContactMailerTest < ActionMailer::TestCase

 test "contact_message builds correct email" do
    mail = ContactMailer.with(
      message_body: "Hello from the website!",
      sender_email: "user@example.com",
      sender_name: "User"
    ).contact_message
  assert_equal "New Web Contact Form Message from User", mail.subject
 end
end
