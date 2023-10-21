Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'home#index'

  # Add a route for the "about" page
  get 'about', to: 'about#index'

  # Player routes
  resources :player, only: [:index, :show], path: 'player'

  # PlayerHome routes
  resources :player_home, only: [:index, :show], path: 'player_home'

  # HomeFurniture routes
  resources :home_furniture, only: [:index, :show], path: 'home_furniture'

  # Furniture routes
  resources :furniture, only: [:index, :show], path: 'furniture'
end
