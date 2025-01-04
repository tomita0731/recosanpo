Rails.application.routes.draw do

  get 'relationships/followings'
  get 'relationships/followers'
  devise_for :admin, skip: [:registrations, :password], controllers: {
    sessions: 'admin/sessions'
  }

  namespace :admin do
    resources :users, only: [:index, :show, :destroy]
    resources :posts, only: [:show, :destroy] do
      resources :post_comments, only: [:destroy]
    end
  end

  scope module: :public do
    devise_for :users
    devise_scope :user do
      post "users_guest_sign_in", to: "sessions#guest_sign_in"
    end
    root to: "homes#top"
    get "homes/about"
    get 'mypage', to: 'users#mypage'
    get "search" => "searches#search"
    resources :users, only: [:edit, :show, :index, :update, :destroy] do
      resource :relationships, only: [:create, :destroy]
        get 'followings' => 'relationships#followings', as: 'followings'
        get 'followers' => 'relationships#followers', as: 'followers'
      member do
        get :favorites
      end
    end

    resources :posts, only: [:new, :index, :show, :edit, :create, :update, :destroy] do
      resource :favorites, only: [:create, :destroy]
      resources :post_comments, only: [:create, :destroy]
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end