Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
  #resources :users
  
  post "/users", to: "users#create"
  get "/users", to: "users#show"
  post "/auth/login", to: "auth#login"

  namespace :api do
    namespace :v1 do
      resources :bundle
      resources :company
      resources :product
      resources :products_bundle
      resources :products_purchase_order
      resources :purchase_order
      resources :sale_history
      resources :user
      resources :vendor
      resources :warehouse
    end
  end
end
