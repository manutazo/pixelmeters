Pixelmeters::Application.routes.draw do
  resources :tracks
  devise_for :users
  root to: "home#index"
  get 'track', to: "tracks#create"
  get '/', to: "home#index"
  get '/pixels/index', to: "pixels#index"
  get '/pixels/:id', to: "pixels#show"

end
