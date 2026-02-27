class ContactMailer < ApplicationMailer
  def contact_message
    @message_body = params[:message_body]
    @sender_email = params[:sender_email]
    @sender_name = params[:sender_name]
    mail to: "contact@gattoniwebdev.com", subject: "New Web Contact Form Message from #{@sender_name}"
  end
end
