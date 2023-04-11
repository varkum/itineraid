module User::Tripable
  extend ActiveSupport::Concern
  
  included do
    has_many :trips, dependent: :destroy
  end  
  
  def add_new_trip_to(location, from:, to:)
    trip = self.trips.create(from: from, to: to)
    trip.create_location place: location[:place], country: location[:country]
    
    return trip
  end 
end 