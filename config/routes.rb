Rails.application.routes.draw do
  devise_for :users

  namespace :admin do
    root to: 'posts#index'
    resources :posts
    resources :categories
  end

  scope module: :site do
    resources :posts, only: %i[index show] do
      get 'by_month', on: :collection
    end
    get 'categories/:id', to: 'categories#show', as: :category
    get 'search', to: 'posts#search', as: :search
    root to: 'posts#index'
  end
end
