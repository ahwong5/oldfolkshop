Rails.application.routes.draw do

  root to: 'static_pages#home'
  get :about, to: 'static_pages#about'
  get :faq, to: 'static_pages#FAQ'

  resources :users, only: [:new, :edit, :create, :update]
  resources :orders
  resources :ordered_items
  resources :items
  resources :categories



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
