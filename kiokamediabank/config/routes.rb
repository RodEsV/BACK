Rails.application.routes.draw do
  get 'welcome/index'
  root 'welcome#index'
    # standard devise routes available at /users
    # NOTE: make sure this comes first!!!
    devise_for :users

    # token auth routes available at /api/v1/auth
    namespace :api, defaults: {format: :json} do
      namespace :v1 do
        mount_devise_token_auth_for 'User', at: 'auth'
        post '/search', to: 'products#search'
        resources :products do
          resources :subproducts
          put :add_tag, on: :member
          put :remove_tag, on: :member
        end
        resources :sales, :only => [:index]
        resources :tags
        resources :types
        resources :categories

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
      end
    end

    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
