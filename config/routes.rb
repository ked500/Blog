Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users, path: "" ,controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks' ,
    registrations: 'users/registrations',
    sessions: 'users/sessions'
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
  resources :microposts do
    resources :likes, only: [:create,:destroy]
  end
end
