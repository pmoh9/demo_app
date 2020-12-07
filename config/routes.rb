Rails.application.routes.draw do
  root 'pages#index'
  resources :articles do
    resources :comments
  end
  resources :users, except: [:new]
  get 'welcome/index'
  get 'about', to: 'pages#about'
  get 'signup', to: 'users#new'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
