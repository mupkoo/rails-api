Rails.application.routes.draw do

    resources :sessions, only: [ :new, :create, :destroy ]
    resources :registrations, only: [ :new, :create ]

    root to: 'home#index'

end
