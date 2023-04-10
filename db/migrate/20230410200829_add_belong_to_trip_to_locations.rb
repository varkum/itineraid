class AddBelongToTripToLocations < ActiveRecord::Migration[7.0]
  def change
    add_belongs_to :locations, :trip, foreign_key: true
  end
end
