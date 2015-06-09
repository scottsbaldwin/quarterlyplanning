Rails.application.routes.draw do
  devise_for :users

  resources :quarters do
    resources :sprints
    resources :initiatives
  end

  resources :teams
  resources :planitems

  get 'plan', to: redirect("/quarters"), as: :plan_redirect
  get 'plan/:id', to: 'plan#index', as: :plan

  root to: 'quarters#index'
end
