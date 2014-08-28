Rails.application.routes.draw do

    resources :sessions, only: [ :new, :create, :destroy ]
    resources :registrations, only: [ :new, :create ]
    resources :todos, except: [ :show, :new, :edit ]

    namespace :api do
        resources :auth, only: [ :create, :destroy ]
    end

    root to: 'home#index'

end
