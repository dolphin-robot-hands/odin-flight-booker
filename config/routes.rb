Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
root "flights#index"

post "/", to: 'flights#create'
get "/bookings/new", to: 'bookings#new'
resources :bookings, only: [:new, :create, :show]

end
