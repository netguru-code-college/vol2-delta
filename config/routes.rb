Rails.application.routes.draw do
  get '/ranking', to: 'ranking#index', as: 'ranking'

  root 'static_pages#index'
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html;
  get '/contact', to: 'static_pages#contact'
  get '/rules', to: 'static_pages#rules'
  get '/about', to: 'static_pages#about'

  resources :crags do
    resources :sectors, except: [:new, :create] do
      resources :climbing_routes do
        resources :ascents
      end
    end
  end
  resources :sectors, only: [:new, :create]
  get '/sectors', to: 'sectors#index'
  get '/climbing_routes', to: 'climbing_routes#show_all_climbing_routes'
  get '/ascents', to: 'ascents#index'
  get '/user/:id', to: 'user_profile#show', as: 'show_user'
  get 'kudos', to: 'static_pages#thanks'
end
