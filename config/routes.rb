Rails.application.routes.draw do
  devise_for :users, controllers: {omniauth_callbacks: 'users/omniauth_callbacks'}
  get 'static_pages/landing_page'
  get 'static_pages/dashboard'
  resources :users
  root "static_pages#landing_page"
end
