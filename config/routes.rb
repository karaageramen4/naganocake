Rails.application.routes.draw do


  devise_for :customers, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: "public/sessions"
  }

  devise_for :admin, skip: [:passwords, :registrations], controllers: {
    sessions: "admin/sessions"
  }

 namespace :public do
  root to: "homes#top"
  get '/about' => "homes#about"

  get 'customers/check'
  get 'customers/my_page', to: 'customers#show', as: 'my_page'
  get 'customers/information/edit', to: 'customers#edit', as: 'edit_information'
  patch 'customers/information', to: 'customers#update'
  patch 'customers/withdraw', to: 'customers#withdraw'

   resources :addresses, only: [:create, :index, :edit, :update, :destroy]
   resources :items, only: [:index, :show]
   delete '/cart_items/destroy_all' => 'cart_items#destroy_all'
   resources :cart_items, only: [:create, :index, :update, :destroy]

   post '/orders/confirm' => 'orders#confirm', as: 'confirm'
   get '/orders/complete' => 'orders#complete', as: 'complete'

   resources :orders, only: [:new, :create, :index, :show]

 end

  namespace :admin do

    get '/' => "homes#top"
    resources :genres, only: [:index, :create, :edit, :update]
    resources :products, only: [:new, :create, :index, :show, :edit, :update]
    resources :customers, only: [:index, :show, :edit, :update]
    resources :orders, only: [:show, :update]
    resources :order_details, only: [:update]

  end

end
