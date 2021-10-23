Rails.application.routes.draw do

  devise_for :managers
  namespace :admin do
    devise_for :managers, controllers: {
      sessions: 'admin/managers/sessions',
      registrations: 'admin/managers/registrations',
      passwords: 'admin/managers/passwords'
    }
  resources :items, except: [:destroy]
  resources :genres, only: [:index, :create, :edit, :update, :destroy]
  resources :customers, except: [:create, :destroy, :new]
  resources :orders, only: [:index, :show, :update]
  end

  scope module: 'customer' do
  devise_for :customers, controllers: {
    sessions: 'customer/customers/sessions',
    registrations: 'customer/customers/registrations',
    passwords: 'customer/customers/passwords'
  }
  resources :items, only: [:index, :show]
  resources :cart_items, only: [:create, :index, :update, :destroy]
  delete '/cart_items' => 'cart_items#all_destroy', as: 'all_destroy'
  post 'orders/check' => 'orders#check', as: 'check'
  get 'orders/thanks' => 'orders#thanks', as: 'thanks'
  resources :orders, only: [:new, :create, :index, :show]
  resources :customers, only: [:edit, :update]
  get 'customers/mypage' => 'customers#show', as: 'mypage'
  get 'customers/delete' => 'customers#delete', as: 'delete'
  patch 'customers/deleted' => 'customers#deleted', as: 'deleted'
  root to: 'homes#top'
  get 'about' => 'homes#about'
  end


end

