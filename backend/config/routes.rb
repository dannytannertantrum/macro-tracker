Rails.application.routes.draw do
  # Namespace allows us to have endpoints under /api, e.g. api/foods
  namespace :api do
    resources :meal_items
    resources :meals
    resources :logs
    resources :foods
    # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

    # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
    # Can be used by load balancers and uptime monitors to verify that the app is live.
    get "up" => "rails/health#show", as: :rails_health_check

    # Defines the root path route ("/")
    # root "posts#index"
  end
end
