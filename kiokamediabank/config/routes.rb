Rails.application.routes.draw do
  get 'welcome/index'
  root 'welcome#index'
    # standard devise routes available at /users
    # NOTE: make sure this comes first!!!
    devise_for :users
    devise_for :admins

    # token auth routes available at /api/v1/auth
    namespace :api, defaults: {format: :json} do
      namespace :v1 do
        mount_devise_token_auth_for 'User', at: 'auth'
        mount_devise_token_auth_for 'Admin', at: 'auth_admin'
        # as :admin do
        #   # Define routes for Admin within this block.
        # end
        post '/search', to: 'products#search'
        resources :products do
          resources :subproducts
          put :add_tag, on: :member
          put :remove_tag, on: :member
        end
        resources :users, :only => [:show, :index] do
          collection do
            post 'login', to: :login
          end
          get '/cart', to: 'carts#show_mine'
          put '/add_to_cart', to: 'carts#add'
          put '/remove_from_cart', to: 'carts#remove'
          get '/whishlist', to: 'whishlists#show_mine'
          put '/add_to_whishlist', to: 'whishlists#add'
          put '/remove_from_whishlist', to: 'whishlists#remove'
          post '/buy_cart_content', to: 'sales#create'
          resources :carts, :only => [:show, :index]
          resources :whishlists, :only => [:show, :index]
          get '/buy_cart_content', to: 'sales#create'
          get '/sales', to: 'sales#list_mine'
          resources :sales, :only => [:show]
        end
        resources :sales, :only => [:index]
        resources :admins, :only => [:show, :index] do
          # collection do
          #   post 'login', to: :login
          # end
        end
        resources :comments_api, :only => [:show, :index]
        resources :tags_api, :only => [:show, :index]
        resources :posts_api, :only => [:show, :index]
        resources :tags do
          put :add, on: :member
          put :remove, on: :member
        end
        resources :types
        resources :categories
        resources :roles
      end
    end

    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
