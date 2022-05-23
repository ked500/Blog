Rails.application.routes.draw do
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks' ,
    registrations: 'users/registrations'
  }
  get 'static_pages/landing_page'
  get 'static_pages/dashboard'
  resources :users
  root "static_pages#landing_page"

  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :relationships, only: [:create, :destroy]
  resources :microposts
end
