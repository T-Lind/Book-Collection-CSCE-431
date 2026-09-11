Rails.application.routes.draw do
  resources :books do
    member do
      get :delete
    end
  end

  resources :users do
    member do
      get :delete
    end
  end

  resources :user_books do
    member do
      get :delete
    end
  end

  get "up" => "rails/health#show", as: :rails_health_check

  root "user_books#index"
end
