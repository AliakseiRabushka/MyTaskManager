Rails.application.routes.draw do
  root 'boards#index'

  resources :session, only: %i[new create]
  resources :users, only: %i[new create]
  resources :boards do
    resources :tasks
  end
end
