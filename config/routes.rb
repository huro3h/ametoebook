Rails.application.routes.draw do
  # get 'articles/index'

  # API json形式で返す
  namespace :api, { format: 'json' } do
    resources :articles, only: :index
  end

  resources :articles

  root to: 'articles#index'

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
end
