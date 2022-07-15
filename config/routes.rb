Rails.application.routes.draw do
  namespace :admin do
    get 'users/index'
    get 'users/new'
    get 'users/show'
    get 'users/edit'
  end
  resources :tasks
  resources :users, only: [:new, :create, :show]
  resources :sessions, only: [:new, :create, :destroy]
  namespace :admin do
    resources :users
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
