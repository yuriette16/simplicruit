Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :positions do
    resources :job_applications
  end
  resources :email_templates
  resources :questionnaire
  resources :questions
end
