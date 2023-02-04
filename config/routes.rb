Rails.application.routes.draw do
  resources :books do
    get 'page/:page', action: :index, on: :collection
  end

  resource :users, only: [:create] do
    member do
      post :register
      post :login
    end
  end
end
