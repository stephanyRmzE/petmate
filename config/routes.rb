Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users, only: [:show, :destroy, :edit, :update]
  get 'users/:id/reservation', to: 'users#reservation', as: :user_reservation
  resources :pets, only: [:create, :new, :destroy, :index, :show, :edit, :update] do
    resources :reservations, only: [:new, :create, :index, :show, :destroy, :edit, :update] do
      member do
        patch 'accept', to: "reservations#accept"
        patch 'reject', to: "reservations#reject"
      end
    end
  end
end
