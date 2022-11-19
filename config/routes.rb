Rails.application.routes.draw do
  root 'pages#show'
  devise_for :users
  resources :users do
    member do
      get :following, :followers, :likes
    end
  end
  resources :posts, only: [:index, :show, :new, :create, :edit, :update, :destroy] do
    resources :likes, only: [:index, :create, :destroy]
  end
  resources :relationships, only: [:create, :destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
