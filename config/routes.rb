Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :listings
      resources :missions, only: [:index]
    end
  end
end
