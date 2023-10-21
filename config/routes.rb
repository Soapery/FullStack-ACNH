Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'home#index'

  # Add a route for the "about" page
  get 'about', to: 'about#index'

  # Player routes
  resources :players, only: [:index, :show], path: 'players'

  # PlayerHome routes
  resources :player_homes, only: [:index, :show], path: 'player_homes'

  # HomeFurniture routes
  resources :home_furnitures, only: [:index, :show], path: 'home_furnitures'

  # Furniture routes
  resources :furnitures, only: [:index, :show], path: 'furnitures'
end
