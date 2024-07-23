Rails.application.routes.draw do
  root 'boards#index'

  resources :session, only: %i[new create destroy]
  resources :users

  resources :boards do
    resources :tasks
  end
end
