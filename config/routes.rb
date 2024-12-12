Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    post "users/guest_sign_in", to: "users/sessions#guest_sign_in"
  end
  root to:"homes#top"
  get "homes/about"
  get 'mypage', to: 'users#mypage'

  get "search" => "searches#search"

  resources :users, only: [:edit, :show, :index, :update, :destroy]
  resources :posts, only: [:new, :index, :show, :edit, :create, :update, :destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end