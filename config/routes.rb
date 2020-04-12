Rails.application.routes.draw do
  devise_for :users
  root to: 'top#index'
  resources :posts, only: [:index, :new, :create, :show, :destroy, :edit, :update] do
    resources :comments, only: :create
    resources :likes, only: :create
    collection do
      get "search"
    end
  end
  resources :tags, only: [:show, :new, :create] do
    member do
      get "search"
    end
  end
  resources :trusts, only: [:create, :destroy]
end
