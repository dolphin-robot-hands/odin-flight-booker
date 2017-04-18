class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  private

    def flight_params
      params.require(:flight).permit(:from_airport_id, :to_airport_id, :start,:id)
    end
end
