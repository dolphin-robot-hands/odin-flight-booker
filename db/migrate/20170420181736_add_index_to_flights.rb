class AddIndexToFlights < ActiveRecord::Migration[5.0]
  def change
    add_index :flights, :from_airport_id
  end
end
