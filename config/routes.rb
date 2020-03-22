Rails.application.routes.draw do
  devise_for :users
  root to: 'top#index'
  resources :posts, only: [:index, :new, :create, :show, :edit, :destroy] do
    resources :comments, only: :create
  end
  resources :tags, only: [:new, :create]
end
