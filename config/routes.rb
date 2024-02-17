Rails.application.routes.draw do


# 顧客用
# URL /customers/sign_in ...
devise_for :customers, skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

# 管理者用
# URL /admin/sign_in ...
devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}

 root to: 'homes#top'
  get '/about' => "homes#about"
  namespace :admin do
    root to: "homes#top"
    resources :orders, only: [:show, :update]
    resources :customers, only: [:index, :show, :edit, :update]
    resources :genres, only: [:index, :create, :edit, :update]
    resources :items, only: [:index, :new, :create, :show, :edit, :update]
    resources :order_details, only: [:update]

  end
  resources :addresses, only: [:index, :edit, :create, :update, :destroy]
  get 'orders/thanks' => "orders#thanks"
  resources :orders, only: [:new, :index, :show, :confirm, :create] do
    post :confirm, on: :collection
  end
  resources :cart_items, only: [:index, :update, :destroy, :create] do
      collection do
        delete "destroy_all"
      end
  end
  resources :cart_items, only: [:index, :update, :destroy, :destroy_all, :create]
  # resources :customers, only: [:unsubscribe, :withdraw]
  get 'customers/my_page' => "customers#show"
  get 'customers/information/edit' => "customers#edit"
  patch 'customers/information' => "customers#update"
  get 'customers/unsubscribe' => "customers#unsubscribe"
  patch 'customers/withdraw' => "customers#withdraw"
 resources :items, only: [:index, :show]


#rails routes
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
