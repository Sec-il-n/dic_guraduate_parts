Rails.application.routes.draw do
  # get 'rooms/index'
  # get 'rooms/create'
  devise_for :users
  root to: 'suggests#index'
  resources :suggests
  resources :rooms do
    resources :messages
  end

  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
end
