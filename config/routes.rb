Rails.application.routes.draw do

  devise_for :users, controllers: {
    omniauth_callbacks: "users/omniauth_callbacks",
  }

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  root to: 'static_pages#home'
  get :about, to: 'static_pages#about'
  get :faq, to: 'static_pages#FAQ'




  # get '/cart' => 'cart#index'
  # get '/cart/clear' => 'cart#clearCart'
  # get '/cart/:id' => 'cart#add'

  get '/users/:id' => 'devise/dashboards#show'
  get :cart, to: "carts#show"
  post :add_item, to: "carts#add_item"
  delete :remove_item, to: "carts#remove_item"
  patch :update_item, to: "carts#update_item"

  resources :orders
  resources :ordered_items
  resources :items
  resources :categories
  # resources :users


  get :addresses, to: "shippings#address"
  get :shippings, to: "shippings#index"
  get :order_confirmation, to: "shippings#order_confirmation"
  get :payments, to: "payments#index"


  scope '/webhooks', controller: :webhooks do
      post 'payment-callback', to: 'webhooks#payment_callback', as:
        :payment_callback
    end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
