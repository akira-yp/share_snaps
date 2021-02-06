Rails.application.routes.draw do
  resources :users
  resources :favorites,only:[:create,:destroy]
  resources :sessions, only:[:new, :create, :destroy]
  resources :pictures do
    collection do
      post :confirm
    end
  end
end
