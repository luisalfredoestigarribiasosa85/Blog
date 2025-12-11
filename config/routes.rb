Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }
  resources :articles, only: [:index, :show, :new, :create, :edit, :update, :destroy]
  root 'home#index'
end
