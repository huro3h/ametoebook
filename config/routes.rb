Rails.application.routes.draw do
  # get 'articles/index'

  # API json形式で返す
  namespace :api, { format: 'json' } do
    resources :articles, only: :index
  end

  root to: 'articles#index'
  # resources :articles, defaults: { format: 'json' }, only: %i(index show)

  get 'create' => 'articles#create'

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
end
