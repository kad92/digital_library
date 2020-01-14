Rails.application.routes.draw do

  devise_for :users, controllers: { registrations: "users/registrations", sessions: "users/sessions" }
  devise_for :admin_users, controllers: {registrations: "admin_users/registrations", sessions: "admin_users/sessions"}
  get 'landing_page/index'


  get "admin/dashboard", to: 'admin_users/dashboards#index', as: :admin_home


  resources :users, only: [:update]
  resources :admin_users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
