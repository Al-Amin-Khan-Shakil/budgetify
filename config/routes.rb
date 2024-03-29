Rails.application.routes.draw do
  devise_for :users
  
  # Spalsh screen 
  authenticated :user do
    root "expenses#index", as: :authenticated_root
  end

  unauthenticated do
    devise_scope :user do
      root "splash_screen#index", as: :unauthenticated_root
    end
  end

  # Rails restful routes
  resources :expenses, except: [:edit, :update, :destroy] do
    resources :payments, except: [:edit, :update, :destroy]
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  # get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
