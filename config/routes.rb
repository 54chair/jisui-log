Rails.application.routes.draw do
  root 'pages#show'
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
  end
  resources :users do
    member do
      get :following, :followers, :likes
    end
  end
  resources :posts, only: [:index, :show, :new, :create, :edit, :update, :destroy] do
    resources :likes, only: [:index, :create, :destroy]
  end
  resources :posts do
    resources :comments, only:[:create, :destroy]
  end
  resources :relationships, only: [:create, :destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
