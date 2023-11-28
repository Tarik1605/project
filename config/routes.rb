Rails.application.routes.draw do
  root "users#index"

  get "/", to: "users#edit"

  resources :users
end