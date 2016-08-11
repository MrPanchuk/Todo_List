Rails.application.routes.draw do
  devise_for :users
  
  resources :projects
  resources :tasks

  devise_scope :user do
    root 'home#index'
  end
  
end
