require 'sidekiq/web'

Rails.application.routes.draw do
  resources :events
  resources :notes
  resources :reports
  resources :managers
  resources :companies
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  root "events#index"
  mount Sidekiq::Web => "/sidekiq"

  post '/add_note_from_event', to: 'events#add_note_from_event'
end
