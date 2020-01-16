Rails.application.routes.draw do
  # root :to => "landing_page#index"
  devise_for :users, controllers: { registrations: "users/registrations", sessions: "users/sessions" }
  devise_for :admin_users, controllers: {registrations: "admin_users/registrations", sessions: "admin_users/sessions"}
  get 'landing_page/index'


  get "admin/dashboard", to: 'admin_users/dashboards#index', as: :admin_home


  resources :users, only: [:update]
  resources :admin_users

  devise_scope :user do
      root :to => 'devise/sessions#new', as: :authenticated_user_root
      # root :to => 'students/dashboards#show', :constraints => lambda{ |req| req.session['warden.user.user.key'][0] == 'User' }
  end

  devise_scope :admin_user do
      root :to => 'devise/sessions#new', as: :authenticated_admin_user_root
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
