class Contact
  attr_reader :user_id, :name, :phone_number, :contact_id

  def initialize(data)
    @contact_id = data[:id]
    @user_id = data[:attributes][:user_id]
    @name = data[:attributes][:name]
    @phone_number = data[:attributes][:phone_number]
  end
end
