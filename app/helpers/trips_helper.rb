module TripsHelper
  def my_trips_path 
    user_trips_path(Current.user)
  end 
  
  def my_trip_path_for(trip)
    user_trip_path(Current.user, trip)
  end 
end
