Rails.application.routes.draw do
  devise_for :users
  resources :users, except: [:destroy] do
    resources :horses
    resources :charges, only: [:index, :show]
    resources :events, only: [:index, :show]
    resources :events, only: [:index, :show]
    resources :notes, only: [:index, :show]
  end

  resources :horses do
    resources :users, only: [:show]
    resources :charges, except: [:index, :show]
    resources :events, except: [:index, :show]
    resources :veternarians, only: [:show]
    resources :farriers, only: [:show]
    resources :notes, only: [:index, :show]
  end

  resources :farriers
  resources :veterinarians
  resources :notes
  resources :charges
  resources :events

  root 'users#new'
end
