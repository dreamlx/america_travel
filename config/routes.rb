Rails.application.routes.draw do
  root 'welcome#index'
  resources :admins
  resources :users
  get     'login'   => 'sessions#new'
  post    'login'   => 'sessions#create'
  delete  'logout'  => 'sessions#destroy'
end
