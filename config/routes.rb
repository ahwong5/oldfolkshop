Rails.application.routes.draw do
  devise_for :users
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root to: 'static_pages#home'
  get :about, to: 'static_pages#about'
  get :faq, to: 'static_pages#FAQ'

  # get '/cart' => 'cart#index'
  # get '/cart/clear' => 'cart#clearCart'
  # get '/cart/:id' => 'cart#add'

  get :cart, to: "carts#show"
  post :add_item, to: "carts#add_item"
  delete :remove_item, to: "carts#remove_item"
  patch :update_item, to: "carts#update_item"

  resources :orders
  resources :ordered_items
  resources :items
  resources :categories



end
