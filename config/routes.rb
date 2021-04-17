Rails.application.routes.draw do
  get 'relationships/create'
  get 'relationships/destroy'
  root "sessions#new"
  resources :users
  resources :favorites,only:[:index,:create,:destroy]
  resources :sessions, only:[:new, :create, :destroy]
  resources :relationships, only:[:create, :destroy]
  resources :pictures do
    collection do
      post :confirm
    end
  end
  mount LetterOpenerWeb::Engine, at: "/inbox" if Rails.env.development?
end
