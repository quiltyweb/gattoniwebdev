class ContactsController < ApplicationController
  http_basic_authenticate_with name: Rails.application.credentials.dig(:contact_login, :username), password: Rails.application.credentials.dig(:contact_login, :password), only: :new

  invisible_captcha only: [:create], honeypot: :subtitle

  def new
    @contact = Contact.new
  end
  def create
    @contact = Contact.new(contact_params)
    if @contact.valid?
      ContactMailer.with(
        sender_name: contact_params[:name],
        sender_email: contact_params[:email],
        message_body: contact_params[:message]
      ).contact_message.deliver_now
      
      respond_to do |format|
        format.turbo_stream { render :create }
      end
    else
      respond_to do |format|
        format.turbo_stream { render :create, status: :unprocessable_entity }
      end
    end
  end
 
  private

  def contact_params
    params.require(:contact).permit(:name, :email, :message)
  end

end
