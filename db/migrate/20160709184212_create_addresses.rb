class CreateAddresses < ActiveRecord::Migration[5.0]
  def change
    create_table :addresses do |t|
      t.string :line1
      t.string :line2
      t.string :zip
      t.string :city
      t.string :country

      t.timestamps
    end
  end
end
