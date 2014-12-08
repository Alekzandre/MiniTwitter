Rails.application.routes.draw do
  devise_for :users
  root 'users#index'
  resources :users, except: [:new, :create, :edit, :update, :destroy] do
    resources :posts do
      resources :comments, only: [:new, :create, :edit, :update, :destroy]
    end
  end    
end