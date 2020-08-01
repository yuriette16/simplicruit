Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :job_applications, only: [:index, :show] do
    resources :questionnaires, only: [:index,:edit,:update]
  end

  resources :questions, only:[:index, :create, :edit,:update]

  resources :positions, only: [:index] do
     resources :skill_requirements, only:[:index, :create, :edit, :update]
  end
  resources :email_templates, only: [:index, :show, :edit, :update]

end
