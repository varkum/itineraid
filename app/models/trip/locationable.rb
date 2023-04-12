module Trip::Locationable
  extend ActiveSupport::Concern
  included do 
    has_one :location
    delegate :place, :country, to: :location, allow_nil: true
    after_destroy :delete_unused_locations
  end 
  
  private 
  
  def delete_unused_locations
    location = self.location
    if location.has_no_trips?
      location.destroy
    end 
  end 
end 