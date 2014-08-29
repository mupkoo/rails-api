Rails.application.routes.draw do

    resources :sessions, only: [ :new, :create, :destroy ]
    resources :registrations, only: [ :new, :create ]
    resources :todos, except: [ :show, :new, :edit ]

    namespace :api do
        resources :auth, only: [ :create, :destroy ]
        resources :users, only: [ :show ]

        resources :todos, except: [ :new, :edit ]

        match '*all', to: 'base#cors_preflight_check', via: [ :options ]
    end

    root to: 'home#index'

end
