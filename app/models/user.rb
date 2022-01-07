class User < ApplicationRecord
  validates_presence_of :name
  validates_presence_of :email
  validates_presence_of :token
  validates_presence_of :google_id
end
