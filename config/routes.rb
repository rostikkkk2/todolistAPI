Rails.application.routes.draw do
  root 'application#docs'

  namespace :api do
    namespace :v1 do
      post 'sign_up', controller: :users, action: :create
      post 'sign_in', controller: :session, action: :create
      delete 'log_out', controller: :session, action: :destroy

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
