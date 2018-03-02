class Event < ActiveRecord::Base
  belongs_to :user
  has_many :moments
end

#Models do the work of sorting classes, methods, and data structures.
#The chef of the application
#Gain a better understanding of how models are working
#look up belongs_to rails
