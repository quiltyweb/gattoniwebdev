class ContactsController < ApplicationController
  invisible_captcha only: [:create], honeypot: :subtitle
  def create
    @contact = Contact.new(contact_params)
    if @contact.valid?
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
