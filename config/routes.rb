Rails.application.routes.draw do
  devise_for :users
  root 'pages#index'
  get 'pages/show'
  get '/posts/new', to: 'posts#new'
  post '/posts', to: 'posts#create'
  get '/posts/index', to: 'posts#index'
  get '/posts/:id', to: 'posts#show'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
