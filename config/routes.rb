Rails.application.routes.draw do
  get 'ranking/index'

  root 'static_pages#index'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/contact', to: 'static_pages#contact'
  get '/rules', to: 'static_pages#rules'
  get '/about', to: 'static_pages#about'

  resources :crags do
    resources :sectors, except: [:new, :create] do
      resources :climbing_routes do
        resources :ascents, except: [:index]
      end
    end
  end
  resources :sectors, only: [:new, :create]
  get '/sectors', to: 'sectors#index'
  get '/climbing_routes', to: 'climbing_routes#show_all_climbing_routes'
<<<<<<< HEAD
  get '/ascents', to: 'ascents#index'
=======
  get '/user/:id', to: 'user_profile#show', as: 'show_user'
>>>>>>> user-profile-pages
end
