class ContactsController < ApplicationController
  def new
  end

  def create
    @contact = ContactsFacade.create_contact(contact_params)
    redirect_to '/dashboard'
  end

  def edit
    @contact = ContactsFacade.get_contact(params[:id])
  end

  def update
    @contact = ContactsFacade.get_contact(params[:id])
    ContactsFacade.edit_contact(contact_params, @contact.id)

  end

  def destroy
    @contact = ContactsFacade.get_contact(params[:id])
    ContactsFacade.delete_contact(@contact.id)
  end

  private

  def contact_params
    params.permit(:user_id, :name, :phone_number)
  end
end
