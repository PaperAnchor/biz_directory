Rails.application.routes.draw do
  devise_for :users
  resources :businesses do
    collection do
      get 'search'
    end
  end
  resources :categories
  resources :contacts, only: [:new, :create]
  resources :admin
  get "admin" => "admin#index"
  get 'welcome/index'
  root 'welcome#index'
  
  get '*path' => redirect('/')
end
