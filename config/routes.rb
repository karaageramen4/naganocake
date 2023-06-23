Rails.application.routes.draw do
  namespace :admin do
    get 'products/index'
    get 'products/new'
    get 'products/create'
    get 'products/show'
    get 'products/edit'
    get 'products/update'
  end
  namespace :public do
    get 'shipping_addresses/index'
    get 'shipping_addresses/edit'
    get 'shipping_addresses/create'
    get 'shipping_addresses/update'
    get 'shipping_addresses/destroy'
  end
  namespace :public do
    get 'items/index'
    get 'items/show'
  end
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
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
