Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users, only: [:show, :destroy, :edit, :update]
  resources :pets, only: [:create, :new, :destroy, :index, :show, :edit, :update] do
    resources :reservations, only: [:new, :create, :index, :show, :destroy, :edit, :update]
  end
end
