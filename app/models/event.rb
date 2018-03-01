class Event < ActiveRecord::Base
  belongs_to :user
  has_many :moments
end

#Models do the work of sorting classes, methods, and data structures.
#The chef of the application 
