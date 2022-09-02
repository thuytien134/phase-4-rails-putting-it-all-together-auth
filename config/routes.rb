Rails.application.routes.draw do
  get "users", to: "users#index"
  post "/signup", to: "users#create"
  get "/me", to: "users#show"
  post "/login", to: "sessions#create"
  get "/recipes", to: "recipes#index"
  post "/recipes", to: "recipes#create"
  delete "/logout", to: "sessions#destroy"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
