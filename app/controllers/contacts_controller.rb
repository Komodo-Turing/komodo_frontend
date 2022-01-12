class ContactsController < ApplicationController
  def new
    @user_id = session[:user_id]
  end

  def create
    @user_id = session[:user_id]
    new_contact = ContactsFacade.create_contact(contact_params)
    redirect_to '/dashboard'
  end

  def edit
    @user_id = session[:user_id]
    @contact = ContactsFacade.get_contact(params[:id])
  end

  def update
    @contact = ContactsFacade.get_contact(params[:id])
    ContactsFacade.edit_contact(contact_params, @contact.contact_id)
    redirect_to '/dashboard'
  end

  def destroy
    @contact = ContactsFacade.get_contact(params[:id])
    ContactsFacade.delete_contact(@contact.contact_id)
  end

  private

  def contact_params
    params.permit(:user_id, :name, :phone_number, :id)
  end
end
