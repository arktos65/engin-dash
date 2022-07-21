Rails.application.routes.draw do
  resources :roles
  resources :projects
  resources :streams
  resources :sources
  resources :departments
  devise_for :admins
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
