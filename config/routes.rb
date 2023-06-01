require 'sidekiq/web'
Rails.application.routes.draw do
  mount Sidekiq::Web => '/sidekiq'
  get 'orders/index'
  post 'orders/download_invoice'
  get 'carts/checkout'
  post 'carts_verify_payment' => 'carts#carts_verify_payment'
  root 'products#index'
  resources :products 
  resources :addresses
  devise_for :users
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  get 'carts/:id' => 'carts#show', as: 'cart'
  delete 'carts/:id' => 'carts#destroy'

  post 'line_items/:id/add' => 'line_items#add_quantity', as: 'line_item_add'
  post 'line_items/:id/reduce' => 'line_items#reduce_quantity', as: 'line_item_reduce'
  post 'line_items' => 'line_items#create'
  get 'line_items/:id' => 'line_items#show', as: 'line_item'
  delete 'line_items/:id' => 'line_items#destroy'
  post '/subscriptions' => 'products#subscriptions'
  post '/success_subscriptions' => 'products#success_subscriptions'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
