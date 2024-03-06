Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  resources :articles do
    resources :orders, only: [:create]
  end

  resources :orders, only: :destroy do
    patch "accept", to: "pages#accept"
    patch "reject", to: "pages#reject"
  end

  resources :users, only: :show do
    resources :reviews, only: [:create]
  end
  get "control", to: "pages#control"

end
