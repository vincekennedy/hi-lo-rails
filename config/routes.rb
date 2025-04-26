Rails.application.routes.draw do
  root "sessions#new"
  # Session routes
  get "login", to: "sessions#new"
  post "login", to: "sessions#create"
  delete "logout", to: "sessions#destroy"

  # API routes
  namespace :api do
    namespace :v1 do
      post 'login', to: 'sessions#create'
    end
  end

  mount API::Base, at: "/"
  resources :sessions, only: [:new, :create, :destroy]
  resources :courses, only: [:index, :new, :create, :edit, :update, :destroy]
  resources :courses
  resources :holes



  # User routes
  get "signup", to: "users#new"
  post "signup", to: "users#create"

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
end
