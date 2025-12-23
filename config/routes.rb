Rails.application.routes.draw do
  resources :articles do
    resources :comments, shallow: true
  end
  devise_for :users, controllers: { registrations: 'users/registrations' }
  root 'home#index'
end
