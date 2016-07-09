class CreateTrips < ActiveRecord::Migration[5.0]
  def change
    create_table :trips do |t|
      t.date :started_at
      t.date :ended_at

      t.timestamps
    end
  end
end
