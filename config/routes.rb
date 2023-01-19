Rails.application.routes.draw do
  resources :books
  resource :users, only: [:create] do
    member do
      post :register
      post :login
    end
  end
end
