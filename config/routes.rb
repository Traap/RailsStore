Rails.application.routes.draw do
  resource :session
  resource :unsubscribe, only: [ :show ]

  resources :passwords, param: :token

  root "products#index"
  get "up" => "rails/health#show", as: :rails_health_check
  resources :products do
    resources :subscribers, only: [ :create ]
  end
end
