Rails.application.routes.draw do
  devise_for :users
  
  resources :projects
  resources :tasks
  root to: "devise/sessions#new"
end
