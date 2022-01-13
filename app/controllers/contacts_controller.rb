class ContactsController < ApplicationController
  def new
    @user_id = session[:user_id]
  end

  def create
    @user_id = session[:user_id]
    @contacts = ContactsFacade.get_contacts(@user_id)
     if @contacts.count < 5
       new_contact = ContactsFacade.create_contact(contact_params)
       redirect_to '/dashboard'
       # if new_contact.save  #can't do this. instead, we will have to call the back and get 200 response.
       #do it if have time later.  not urgent
       #   flash[:notice] = "New Contact Successfully Created!"
       #   redirect_to '/dashboard'
       # else
       #   flash[:alert] = "Creating New Contact Failed. Try Again"
       # end
     else
       flash[:alert] = "You can have up to 5 contacts. Either delete or update an existing contact instead!!!!!"
       redirect_to '/dashboard'
     end
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
    redirect_to '/dashboard'
  end

  private

  def contact_params
    params.permit(:user_id, :name, :phone_number, :id)
  end
end
