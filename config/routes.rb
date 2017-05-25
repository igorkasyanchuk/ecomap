Rails.application.routes.draw do
  root 'site#index'

  mount Ckeditor::Engine => '/ckeditor'

  devise_for :users

  resources :pages, only: [:show]

  namespace :admin do
    root 'dashboard#index'

    resources :pages
    resources :users, except: [:show]
  end
end
