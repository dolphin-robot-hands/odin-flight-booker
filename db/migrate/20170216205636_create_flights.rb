class CreateFlights < ActiveRecord::Migration[5.0]
  def change
    create_table :flights do |t|
      t.integer :to_airport
      t.integer :from_airport
      t.datetime :start
      t.integer :duration

      t.timestamps
    end
  end
end
