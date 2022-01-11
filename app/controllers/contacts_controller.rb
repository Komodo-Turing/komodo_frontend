class ContactsController < ApplicationController
  def new
  end

  def create
    @contact = ContactsFacade.create_contact(params)
    redirect_to '/dashboard'
  end
    #need to make strong params
end
