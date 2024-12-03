Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "receipts#new"

  resources :receipts, only: [:new, :create, :index, :show]
end
