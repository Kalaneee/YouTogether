Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'home#index'
  scope '/:locale' do
    root to: 'home#index'

    resources :users do
      resource :favorite_videos, only: [:new, :create]
    end

    resources :sessions, only: [:new, :create, :destroy]

    resources :rooms do
      resource :room_users
    end

    get 'signup', to: 'users#new'
    get 'login', to: 'sessions#new'

    get 'account', to: 'account#edit'
    patch 'account', to: 'account#update'
  end

end
