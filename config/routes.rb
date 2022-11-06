Rails.application.routes.draw do
  root 'pages#index'
  get 'pages/show'
  devise_for :users
  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :posts, only: [:index, :show, :new, :create, :edit, :update, :destroy]
  resources :relationships, only: [:create, :destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
