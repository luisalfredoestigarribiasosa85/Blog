Rails.application.routes.draw do
  resources :articles do
<<<<<<< HEAD
    resources :comments, shallow: true
=======
    resources :comments, only: [:create]
>>>>>>> 98755e4 (stage and commit changes before pull)
  end
  devise_for :users, controllers: { registrations: 'users/registrations' }
  root 'home#index'
end
