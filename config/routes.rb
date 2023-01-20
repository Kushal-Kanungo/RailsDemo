Rails.application.routes.draw do
  resources :books
  resource :users, only: %i[create show index] do
    member do
      post :register
      post :login
    end
  end
end
