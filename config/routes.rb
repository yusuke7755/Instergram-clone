Rails.application.routes.draw do
  root to: 'sessions#index'
  resources :favorites, only: [ :create, :index,:destroy]
  resources :sessions, only: [:new, :create, :destroy, :index]
  resources :users, only: [:new, :create, :show, :edit, :update, :index]

  resources :pictures do
    collection do
      post :confirm
    end
    member do
      patch :confirm
    end
  end
  #mail
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
end
