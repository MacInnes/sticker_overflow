Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  resources :users, only: [:new, :create, :show]

  namespace :admin do
    resources :users
  end

  resources :stickers

  resources :users, only: :show do
    resources :messages, only: [:new, :index, :show, :create]
  end

end
