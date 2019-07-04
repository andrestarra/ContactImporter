class ContactsController < ApplicationController
  def index
    @contacts = Contact.my_contacts(current_user)
  end

  def destroy
    @contact = Contact.find(params[:id])
    @contact.destroy
    redirect_to contacts_path
  end
end
