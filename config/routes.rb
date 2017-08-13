Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  devise_for :users, controllers: { omniauth_callbacks: "omniauth_callbacks" }
  
  scope '(:locale)', local: /[a-z_\-]{2,6}}/i do
    #devise_for :users, skip: :omniauth_callbacks
    resources :pages, only: [:show]

    root 'site#index'

    namespace :admin do
      root 'dashboard#index'

      resources :pages
      resources :users, except: [:show]
      resources :problem_categories, except: [:show]
      resources :problems
    end
  end
end
