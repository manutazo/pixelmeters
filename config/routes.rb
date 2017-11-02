Pixelmeters::Application.routes.draw do
  resources :pixels
  devise_for :users
  root to: "home#index"
  get 'track', to: "tracks#create"

end
