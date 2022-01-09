# require "rails_helper"
#
# RSpec.describe "welcome page", type: :feature do
#   describe "as a user" do
#     before(:each) do
#       @haewon = User.create!(name: "Haewon Jeon", email: "haewonito@gmail.com", token: "something", google_id: "somethingelse", phone_number: "303-249-3081")
#       visit "/"
#       click_on "Sign-In with Google"
#     end
#
#     it "directs returning user to the dashboard" do
#       expect(current_path).to eq("/dashboard")
#     end
#   end
# end
