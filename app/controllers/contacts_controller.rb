class ContactsController < ApplicationController
 
  def create
    @contact = Contact.new(contact_params)
    if @contact.valid?
      # temporarily just print to console, but here we will integrate with the email service to send the message to us
      print "Contact is valid. Name: #{@contact.name}, Email: #{@contact.email}, Message: #{@contact.message}"
    else
       print "Contact is invalid. Errors: #{@contact.errors.full_messages.join(", ")}"
    end
  end
 
  private

  def contact_params
    params.require(:contact).permit(:name, :email, :message)
  end

end
