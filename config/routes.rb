Rails.application.routes.draw do
  devise_for :users
  root to: 'top#index'
  resources :posts, only: [:index, :new, :create, :show, :destroy, :edit, :update] do
    resources :comments, only: :create
  end
  resources :tags, only: [:show, :new, :create]
  resources :likes, only: [:new, :create]
end
