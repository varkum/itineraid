class ChangeDatetimeToTimeForTrip < ActiveRecord::Migration[7.0]
  def change
    change_column :trips, :from, :date
    change_column :trips, :to, :date
  end
end
