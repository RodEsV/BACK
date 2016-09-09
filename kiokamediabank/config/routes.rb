Rails.application.routes.draw do
  mount_devise_token_auth_for "User", at: 'auth'
    namespace :api, defaults: {format: 'json'} do
      namespace :v1 do
        resources :users, :only => [:show, :index]
        resources :comments_api, :only => [:show, :index]
        resources :tags_api, :only => [:show, :index]
        resources :posts_api, :only => [:show, :index]
      end


    end
    default_url_options :host => "localhost:3000"

    get 'welcome/index'
    root'welcome#index'

    # standard devise routes available at /users
    # NOTE: make sure this comes first!!!
    devise_for :users

    # token auth routes available at /api/v1/auth
    namespace :api do
      scope :v1 do
        mount_devise_token_auth_for 'User', at: 'auth'
        resources :products do
          resources :subproducts
        end
        resources :carts
        resources :tags
        resources :types
        resources :categories
        resources :wishlists
        resources :roles
      end
    end

    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
