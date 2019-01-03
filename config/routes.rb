Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :videos , only: [:create, :index]
      resources :projects
      resources :users do
        resources :projects, only: [:index]
      end
    end
  end
end
