Rails.application.routes.draw do


# 顧客用
# URL /customers/sign_in ...
devise_for :customers,skip: [:passwords], controllers: {
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
    resources :orders, only: [:show, :update]
    resources :customers, only: [:index, :show, :edit, :update]
    resources :genres, only: [:index, :create, :edit, :update]
    resources :items, only: [:index, :new, :create, :show, :edit, :update]
    resources :order_details, only: [:update]
    root to: "admins#top"
  end
  resources :adresses, only: [:index, :edit, :create, :update, :destroy]
  resources :orders, only: [:new, :thanks, :index, :show, :confirm, :create]
  get 'orders/thanks' => "orders#thanks"
  resources :cart_items, only: [:index, :update, :destroy, :create] do
      collection do
        delete "destroy_all"
      end
    end
  resources :customers, only: [:unsubscribe, :withdraw]
  get 'customers/my_page' => "customers#show"
  get 'customers/information/edit' => "customers#edit"
  get 'customers/information' => "customers#update"
 resources :items, only: [:index, :show]

#cd nagano_cake
#rails routes
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

