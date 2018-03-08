class Event < ActiveRecord::Base #inherits from ActiveRecord
  belongs_to :user
  has_many :moments
end

#Models determines how data is processed and how it is related to each other.
#The chef of the application

#Specifies a one-to-one association with another class.
#This method should only be used if this class contains the foreign key.
