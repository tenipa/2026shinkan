Rails.application.routes.draw do
  root "pages#home"

  namespace :admin do
    get "login", to: "sessions#new"
    post "login", to: "sessions#create"
    delete "logout", to: "sessions#destroy"
    get "dashboard", to: "dashboard#show"
    resource :site_settings, only: %i[edit update]
    resources :events, except: [:show]
    resources :qa_items, except: [:show]
  end

  get "up" => "rails/health#show", as: :rails_health_check
end
