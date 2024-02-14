Rails.application.routes.draw do
  namespace :admin do
    resources :orders, only: [:show, :update]
    resources :customers, only: [:index, :show, :edit, :update]
    resources :genres, only: [:index, :create, :edit, :update]
    resources :items, only: [:index, :new, :create, :show, :edit, :update]
    resources :order_details, only: [:update]
    root to: "admins#top"
  end
  resources :adresses, only: [:index, :edit, :create, :update, :destroy]
  resources :orders, only: [:new, :thanks, :index, :show, :confirm, :create]
  resources :cart_items, only: [:index, :update, :destroy, :destroy_all, :create]
  resources :customers, only: [:unsubscribe, :withdraw]
  get 'customers/my_page' => "customers#show"
  get 'customers/information/edit' => "customers#edit"
  get 'customers/information' => "customers#update"
 resources :items, only: [:index, :show]
  root to: 'homes#top'
  get '/about' => "homes#about"
  devise_for :admins
  devise_for :customers
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
