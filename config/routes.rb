Rails.application.routes.draw do
  namespace :public do
    get 'cart_items/show'
    get 'cart_items/edit'
    get 'cart_items/update'
    get 'cart_items/destroy'
    get 'cart_items/destro_all'
    get 'cart_items/create'
    get 'cart_items/index'
  end
  namespace :public do
    get 'cart_items/show'
    get 'cart_items/edit'
    get 'cart_items/update'
    get 'cart_items/destroy'
    get 'cart_items/destro_all'
    get 'cart_items/create'
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
