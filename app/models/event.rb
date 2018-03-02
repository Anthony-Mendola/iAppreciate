class Event < ActiveRecord::Base
  belongs_to :user
  has_many :moments
end

#Models do the work of sorting classes, methods, and data structures.
#The chef of the application

#Specifies a one-to-one association with another class.
#This method should only be used if this class contains the foreign key.
