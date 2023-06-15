Rails.application.routes.draw do
  devise_for :users

  namespace :admin do
    root to: 'posts#index'
    resources :posts
    resources :categories
  end

  scope module: :site do
    resources :posts, only: %i[index show]
    get 'categories/:id', to: 'categories#index', as: :category
    root to: 'posts#index'
  end
end
