Rails.application.routes.draw do
  resources :boats
  devise_for :users
  root to: 'boats#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
