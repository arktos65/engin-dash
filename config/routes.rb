Rails.application.routes.draw do
  resources :resource_budgets
  get 'home/index'
  resources :jira_issues
  resources :jira_projects
  resources :teams
  resources :members
  resources :currencies
  resources :roles
  resources :projects
  resources :streams
  resources :sources
  resources :departments
  devise_for :admins
  devise_for :users

  # Default landing page for this application
  root to: "home#index"
end
