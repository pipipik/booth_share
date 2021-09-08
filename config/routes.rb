Rails.application.routes.draw do
  devise_for :users
  root to: "booths#index"
  resources :booths
  resources :users
end
