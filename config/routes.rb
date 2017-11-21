Pixelmeters::Application.routes.draw do
  resources :tracks
  resources :pixels
  devise_for :users
  root to: "home#index"
  get 'track', to: "tracks#create"
  get '/', to: "home#index"

end
