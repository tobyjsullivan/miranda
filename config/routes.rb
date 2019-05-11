Rails.application.routes.draw do
  devise_for :users
  root to: 'home#index'

  resources :boards do
    resources :posts
  end
end
