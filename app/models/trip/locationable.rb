module Trip::Locationable
  extend ActiveSupport::Concern
  included do 
    has_one :location
    delegate :place, :country, to: :location, allow_nil: true
  end 
end 