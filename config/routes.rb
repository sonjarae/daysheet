Rails.application.routes.draw do
  resources :days
  resources :schedules
  resources :incomes
  resources :venues
  resources :tours
  resources :users
  root 'tours#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
