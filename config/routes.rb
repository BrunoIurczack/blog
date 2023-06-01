Rails.application.routes.draw do
  devise_for :users

  namespace :admin do
    root to: 'posts#index'
    resources :posts
  end

  scope module: :site do
    resources :posts, only: %i[index show]
    root to: 'posts#index'
  end
end
