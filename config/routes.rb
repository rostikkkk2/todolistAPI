Rails.application.routes.draw do
  post 'sign_up', controller: :users, action: :create
  post 'sign_in', controller: :session, action: :create
  delete 'log_out', controller: :session, action: :destroy

  resources :projects
  resources :tasks
  resources :comments
end
