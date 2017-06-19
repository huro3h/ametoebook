Rails.application.routes.draw do
  # get 'articles/index'

  # API json形式で返す
  namespace :api, { format: 'json' } do
    resources :articles, only: :index
  end

  root to: 'articles#index'
  get "articles/:id" => 'articles#show', as: :show

  get 'new' => 'articles#new'
  get 'home' => 'articles#home'

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
end
