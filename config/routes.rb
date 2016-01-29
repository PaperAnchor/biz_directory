Rails.application.routes.draw do
  resources :businesses
  get 'welcome/index'
  root 'welcome#index'
end
