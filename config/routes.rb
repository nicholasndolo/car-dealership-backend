Rails.application.routes.draw do
  resources :testimonials, only: [:index, :create, :update]
  resources :reviews
  resources :vehicles, only: [:index, :show, :update, :create, :destroy]
  # resources :admins, only: [:create]

  post "/signup", to: "admins#create"
  get "/me", to: "admins#show"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
end
