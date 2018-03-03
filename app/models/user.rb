class User < ActiveRecord::Base
  has_secure_password
  has_many :events
  has_many :moments, through: :events

  validates :username, presence: true, uniqueness: true
end

#use validation to validate the state of usernames before they go into the database.
#Active Record uses the new_record? instance method to determine whether an object
#is already in the database or not
