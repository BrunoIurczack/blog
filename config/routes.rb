Rails.application.routes.draw do
  devise_for :users

  namespace :admin do
    root to: 'posts#index'
    resource :posts
  end

  scope module: :site do
  end

  root to: 'site/posts#index'
end
