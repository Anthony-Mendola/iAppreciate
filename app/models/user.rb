class User < ActiveRecord::Base
  has_secure_password
  has_many :events
  has_many :moments, through: :events
end


#use validation to authenticate usernames, activerecord validations, rails guide
