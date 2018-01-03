Rails.application.routes.draw do
  get 'home/stream'

  resources :feeds
  devise_for :users

  root 'home#stream'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
