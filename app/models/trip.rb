class Trip < ApplicationRecord
  belongs_to :user
  has_one :location
end
