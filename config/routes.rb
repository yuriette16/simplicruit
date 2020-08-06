Rails.application.routes.draw do
  require "sidekiq/web"
  authenticate :user, lambda { |u| u.admin } do
    mount Sidekiq::Web => '/sidekiq'
  end
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :job_applications, only: [:index, :show, :edit, :update] do
    resources :questionnaires, only: [:index, :create, :destroy,:edit,:update]
  end

  resources :questions, only:[:index, :create, :edit,:update]

  resources :positions, only: [:index] do
     resources :skill_requirements, only:[:index, :edit, :update]
  end
  resources :email_templates, only: [:index, :show, :edit, :update]

end
