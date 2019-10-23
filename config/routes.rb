Rails.application.routes.draw do
  get '/' => redirect('/login')
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/login',  to: 'sessions#destroy', as: :logout
  resources :ingredients
  resources :restaurants
  resources :dishes
  resources :chefs
  resources :users
  resources :favorite_chefs
  resources :favorite_restaurants
  resources :favorite_dishes
  resources :chef_comments
  resources :dish_comments
  resources :restaurant_comments
end
