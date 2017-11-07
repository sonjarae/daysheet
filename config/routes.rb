Rails.application.routes.draw do
  resources :days
  resources :schedules
  resources :incomes
  resources :venues
  resources :tours
  resources :users
  root 'tours#index'
  post 'controller/action/:id' => 'controller#action'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
