class RemoveToAirportFromFlights < ActiveRecord::Migration[5.0]
  def change
    remove_column :flights, :to_airport, :integer
  end
end
