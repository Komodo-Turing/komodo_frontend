class Contact
  attr_reader :user_id, :name, :phone_number

  def initialize(data)
    @user_id = data[:attributes][:user_id]
    @name = data[:attributes][:name]
    @phone_number = data[:attributes][:phone_number]
  end
end
