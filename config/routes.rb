Rails.application.routes.draw do
  resource :users, only: [:create] do
    member do
      post :register
      post :login
    end
  end
end
