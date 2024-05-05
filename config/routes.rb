require 'sidekiq/web'

Rails.application.routes.draw do
  mount Sidekiq::Web => '/sidekiq'
  get "up" => "rails/health#show", as: :rails_health_check
  
  post "/users", to: "users#create"
  get "/users", to: "users#show"
  post "/login", to: "auth#login"
  post "update_lead_time", to: "companies#update_lead_time"
  post "update_forecasting_days", to: "companies#update_forecasting_days"
  post "update_days_of_stock", to: "companies#update_days_of_stock"
  post "copy_vendors_as_suppliers", to: "products#copy_vendors_as_suppliers"
  post "upload_pos", to: "upload#upload_pos"
end
