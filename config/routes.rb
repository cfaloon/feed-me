Rails.application.routes.draw do
  get 'home/stream'

  resources :feeds
  resources :subscriptions, only: [:create, :destroy]
  devise_for :users

  root 'home#stream'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
