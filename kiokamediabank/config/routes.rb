Rails.application.routes.draw do
  get 'welcome/index'
  root 'welcome#index'
    # standard devise routes available at /users
    # NOTE: make sure this comes first!!!
    devise_for :users
    devise_for :companies
    devise_for :admins

    # token auth routes available at /api/v1/auth
    namespace :api, defaults: {format: :json} do
      namespace :v1 do
        mount_devise_token_auth_for 'User', at: 'auth'
        mount_devise_token_auth_for 'Admin', at: 'auth_admin'
        mount_devise_token_auth_for 'Company', at: 'auth_company'

        # as :company do
        #   # Define routes for Company within this block.
        # end

        # as :admin do
        #   # Define routes for Admin within this block.
        # end

        resources :products do
          resources :subproducts
          put :add_tag, on: :member
          put :remove_tag, on: :member
        end
        resources :users, :only => [:show, :index] do
          collection do
            post 'login', to: :login
          end
        end
        resources :comments_api, :only => [:show, :index]
        resources :tags_api, :only => [:show, :index]
        resources :posts_api, :only => [:show, :index]
        resources :carts do
          put :add, on: :member
          put :remove, on: :member
        end
        resources :tags do
          put :add, on: :member
          put :remove, on: :member
        end
        resources :types
        resources :categories
        resources :whishlists do
          put :add, on: :member
          put :remove, on: :member
        end
        resources :roles
        resources :sales
      end
    end

    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
