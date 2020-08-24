Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  require "sidekiq/web"
  authenticate :user, lambda { |u| u.admin } do
    mount Sidekiq::Web => '/sidekiq'
  end
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :job_applications, only: [:index, :show, :edit, :update] do
    resources :questionnaires, only: [:index, :create,:edit,:update]
  end
  resources :questionnaires, only: [:destroy]

  resources :positions, only: [:index,:create] do
     resources :skill_requirements, only:[:index]
     get 'skill_requirements/edit_all', to: 'skill_requirements#edit_all', :as => :skill_requirement_edit_all
     patch 'skill_requirements/update_all', to: 'skill_requirements#update_all', :as => :skill_requirement_update_all
  end
  resources :email_templates, only: [:index, :show, :edit, :update]

  resources :category, only: [:create] do
     resources :questions, only:[:index, :create, :edit, :update]
  end

  get "job_applications/:id/uploaded", to: "job_applications#uploaded", as: 'uploaded'

end
