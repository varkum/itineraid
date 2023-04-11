class RemoveForeignKeyFromLocations < ActiveRecord::Migration[7.0]
  def change
    remove_foreign_key :locations, :trips
  end
end
