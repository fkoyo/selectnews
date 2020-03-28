Rails.application.routes.draw do
  devise_for :users
  root to: 'top#index'
  resources :posts, only: [:index, :new, :create, :show, :destroy, :edit, :update] do
    resources :comments, only: :create
    resources :likes, only: :create
  end
  resources :tags, only: [:show, :new, :create]
end
