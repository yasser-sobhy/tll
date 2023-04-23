Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "slots#index"
  resources :slots do
    collection do
      get :available
    end
  end
end
