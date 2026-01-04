Rails.application.routes.draw do
  resources :articles do
    resources :comments, only: [:create]
    resources :articles, only: [:index, :show, :new, :create, :edit, :update, :destroy]
  end
  resources :news, only: [:index]
  devise_for :users, controllers: { registrations: 'users/registrations' }
  root 'home#index'
end
