class User::TripsController < ApplicationController
  before_action :set_trip, only: %i[ show edit update destroy ]

  def index
    @trips = Current.user.trips.all
  end

  def show
  end

  def new
    @trip = Current.user.trips.new
  end

  def edit
  end

  def create
    location = { place: trip_params[:place], country: trip_params[:country] }
    if (trip = Current.user.add_new_trip_to location, from: trip_params[:from], to: trip_params[:to])
        redirect_to user_trip_url(Current.user, trip), notice: "Trip was successfully created." 
    end
  end

  def update
    redirect_to trip_url(@trip), notice: "Trip was successfully updated." 
  end

  def destroy
    @trip.destroy
    redirect_to trips_url, notice: "Trip was successfully destroyed."
   
  end

  private
    
    def set_trip
      @trip = Current.user.trips.find(params[:id])
    end


    def trip_params
      params.require(:trip).permit(:from, :to, :place, :country)
    end
    
end
