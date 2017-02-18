class Flight < ApplicationRecord
  belongs_to :from_airport, :class_name => "Airport"
  belongs_to :to_airport, :class_name => "Airport"

  def flight_info
    "#{from_airport.code} to #{to_airport.code} on #{start}"
  end
end
