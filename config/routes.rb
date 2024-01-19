Rails.application.routes.draw do
  get 'subject/index'
  devise_for :users
  # get 'books/index'
  # # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
  resources :books
  get "books/show_user/:id", to: "books#show_user"
  # get "users/loging", to: "users#loging"
  # Defines the root path route ("/")
  # root "posts#index"
end
