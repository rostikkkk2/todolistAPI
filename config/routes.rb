Rails.application.routes.draw do
  root 'application#docs'

  namespace :api do
    namespace :v1 do
      resources :users, only: :create
      resources :session, only: %i[create destroy]

      resources :projects do
        resources :tasks, shallow: true do
          resources :complete, only: :update
          resources :position, only: :update
          resources :comments, only: %i[create destroy]
        end
      end
    end
  end
end
