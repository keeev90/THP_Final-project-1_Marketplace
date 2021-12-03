Rails.application.routes.draw do

 

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  root 'items#index'
  resources 'items'
  resources 'users'

  resources 'orders', only: [:index, :show]


  # Custum routes :
  resource 'myprofile', only: [:show, :edit, :update, :destroy], :path => "mon-compte"
  resource 'mycart', only: [:show], :path => "mon-chat-riot"
  
  resources 'carts'

  resources 'join_table_item_carts', only: [:create, :edit, :update, :destroy]

  scope '/checkout' do
    post 'create', to: 'checkout#create', as: 'checkout_create'
    get 'success', to: 'checkout#success', as: 'checkout_success'
    get 'cancel', to: 'checkout#cancel', as: 'checkout_cancel'
  end

  namespace :admin do
    root 'board#index'
    resources :items do 
      resources :item_pictures, only: [:create]
      get 'mask', on: :collection
    end
  end

end
