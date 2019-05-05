Rails.application.routes.draw do
  post 'sign_up', controller: :users, action: :create
  post 'sign_in', controller: :login, action: :create
  delete 'log_out', controller: :login, action: :destroy
end
