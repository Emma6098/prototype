Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  resources :articles do
    resources :orders, only: [:create]
  end

  resources :orders, only: :destroy do
    patch "accept", to: "orders#accept"
    patch "reject", to: "orders#reject"
    post 'submit_counter_offer', to: 'orders#submit_counter_offer', as: 'submit_counter_offer'
  end

  resources :users, only: :show do
    resources :reviews, only: [:create]
  end

  get "control", to: "pages#control"
  get "control2", to: "pages#control2"
  post 'submit_counter_offer', to: 'orders#submit_counter_offer', as: 'submit_counter_offer'

end
