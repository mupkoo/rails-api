Rails.application.routes.draw do

    resources :registrations, only: [ :new, :create ]

    root to: 'home#index'

end
