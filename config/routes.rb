Rails.application.routes.draw do
  # root :to => "landing_page#index"
  devise_for :users, controllers: { registrations: "users/registrations", sessions: "users/sessions" }
  devise_for :admin_users, controllers: {registrations: "admin_users/registrations", sessions: "admin_users/sessions"}

  resources :users, only: [:update]
  resources :admin_users

  devise_scope :user do
      authenticated :user do
        get '/' =>  'devise/sessions#new', as: :authorized_user_root
        # root :to => 'students/dashboards#show', :constraints => lambda{ |req| req.session['warden.user.user.key'][0] == 'User' }
      end
      unauthenticated :user do
        get '/user/signin' =>  'devise/sessions#new', as: :unauthorized_user_root
      end
  end

  devise_scope :admin_user do
    authenticated :admin_user do
      root to: 'admin_users/dashboards#index', as: :authenticated_admin_user_root
    end
    unauthenticated :admin_user do
      get "/admin/signin" => 'devise/sessions#new', as: :unauthenticated_admin_user_root
    end
  end


  get '/admin/dashboard' => 'admin_users/dashboards#index', as: :admin_home
  get '/admin/manage_inventory' => 'admin_users/manage_inventories#index', as: :manage_inventory

  namespace :admin do
    resources :books, only:[:new,:update,:edit,:show]
  end

  root to: "landing_page#index"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
