Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :listings, only: [:index, :show, :create, :update, :delete]
      resources :missions, only: [:index]
    end
  end
end
