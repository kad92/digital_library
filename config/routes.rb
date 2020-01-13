Rails.application.routes.draw do
  get 'landing_page/index'
  devise_for :users, controllers: { registrations: "users/registrations", sessions: "users/sessions" }
  devise_for :admin_users, controllers: {registrations: "admin_users/registrations", sessions: "admin_users/sessions"}
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
