class Trip < ApplicationRecord
  include Locationable
  
  belongs_to :user
 
end
