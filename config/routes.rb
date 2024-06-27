Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :authors, only: [:index, :show, :new, :create]
  resources :books, only: [:index, :show, :new, :create]
  resources :genres, only: [:index, :show, :new, :create]
  resources :reviews, only: [:index, :show]
  get 'about', to: 'pages#about'
  root 'books#index'
end
