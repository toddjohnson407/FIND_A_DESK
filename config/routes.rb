Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :desks do
   resources :bookings
  end
  get "/current_index", to: "desks#current_index"
  get "/bookings/current_index", to: "bookings#current_index"
  get "/search_results", to: "desks#search_results"
end
