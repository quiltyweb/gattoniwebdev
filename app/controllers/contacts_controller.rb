class ContactsController < ApplicationController
  http_basic_authenticate_with name: Rails.application.credentials.dig(:contact_login, :username), password: Rails.application.credentials.dig(:contact_login, :password), only: :new

  invisible_captcha only: [:create], honeypot: :subtitle

  def new
    @contact = Contact.new
  end
  def create
    @contact = Contact.new(contact_params)
    if @contact.valid?
      begin
        ContactMailer.with(
          sender_name: contact_params[:name],
          sender_email: contact_params[:email],
          message_body: contact_params[:message]
        ).contact_message.deliver_now
        
        respond_to do |format|
          format.turbo_stream { render :create }
        end
      rescue StandardError => e
        Rails.logger.error "[CONTACT FORM ERROR]"
        Rails.logger.error "Class: #{e.class}"
        Rails.logger.error "Message: #{e.message}"
        Rails.logger.error e.backtrace.join("\n")
        handle_error("Mail service error")
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

  def handle_error(message)
    flash.now[:alert] = message

    respond_to do |format|
      format.turbo_stream { render :create, status: :unprocessable_entity }
      format.html { render :new, status: :unprocessable_entity }
    end
  end
end
