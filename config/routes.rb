Rails.application.routes.draw do
  devise_for :users

  namespace :admin do
    root to: 'posts#index'
    resources :posts
  end

  scope module: :site do
    get 'posts', to: 'posts#index'
    get 'posts', to: 'posts#show'
  end

  root to: 'site/posts#index'
end
