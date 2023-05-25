Rails.application.routes.draw do
  devise_for :users
  get 'welcome/index'
  root to: 'welcome#index'

  namespace :admin do
    get 'welcome/index'
    root to: 'welcome#index'
  end
end
