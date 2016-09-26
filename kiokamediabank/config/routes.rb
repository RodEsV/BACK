Rails.application.routes.draw do

  #get 'welcome/index'
    #root 'welcome#index'
    root to: "products#index"

    # standard devise routes available at /users
    # NOTE: make sure this comes first!!!
    devise_for :users

    # token auth routes available at /api/v1/auth
    namespace :api, defaults: {format: :json} do
      namespace :v1 do
        mount_devise_token_auth_for 'User', at: 'auth'
        resources :products, only: [:index]
        resources :users, :only => [:show, :index] do
          collection do
            post 'login', to: :login
          end
        end
        resources :comments_api, :only => [:show, :index]
        resources :tags_api, :only => [:show, :index]
        resources :posts_api, :only => [:show, :index]
        resources :carts, :only => [:show]
        resources :tags
        resources :types
        resources :categories
        resources :wishlists
        resources :roles
        resources :order_items, only: [:create, :update, :destroy]
      end
    end
    get 'order_items/create'

    get 'order_items/update'

    get 'order_items/destroy'

    get 'carts/show'

    get 'products/index'

    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
