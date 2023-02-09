Rails.application.routes.draw do
  resources :books do
    get 'page/:page', action: :index, on: :collection
  end

  post 'api/upload', to: 'uploads#upload'

  resource :users, only: [:create] do
    member do
      post :register
      post :login
    end
  end
end
