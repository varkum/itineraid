class ChangeTripStartAndEnd < ActiveRecord::Migration[7.0]
  def change
    change_table :trips do |t|
      t.rename :start, :from
      t.rename :end, :to
    end 
  end
end
