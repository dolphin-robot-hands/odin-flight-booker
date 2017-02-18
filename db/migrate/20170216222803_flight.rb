class Flight < ActiveRecord::Migration[5.0]
  def change
    remove_column :flights, :from_airport, :integer
    remove_column :flights, :to_airport, :integer
    add_column :flights, :to_airport_id, :integer
    add_column :flights, :from_airport_id, :integer
  end
end
