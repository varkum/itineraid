class CreateTrips < ActiveRecord::Migration[7.0]
  def change
    create_table :trips do |t|
      t.datetime :start
      t.datetime :end
      t.belongs_to :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
