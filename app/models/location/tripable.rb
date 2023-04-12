module Location::Tripable
  def trips
    Trip.where(location: self)
  end 
  
  def has_no_trips?
    self.trips.empty?
  end 
end 