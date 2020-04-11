Rails.application.routes.draw do
  devise_for :users
  root to: 'top#index'
  resources :posts, only: [:index, :new, :create, :show, :destroy, :edit, :update] do
    resources :comments, only: :create
    resources :likes, only: :create
    resources :trusts, only: [:create, :destroy]
  end
  resources :tags, only: [:show, :new, :create]
  
end
