Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
   resources :authors
   resources :books
   resources :genres
   resources :reviews, only: [:index, :show]
   get 'about', to: 'pages#about'
   root 'books#index'
end
