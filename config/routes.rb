Rails.application.routes.draw do

  namespace :admin do
    devise_for :admins
  resources :items, except: [:destroy]
  resources :genres, only: [:index, :create, :edit, :update, :destroy]
  resources :customers, except: [:create, :destroy, :new]
  resources :orders, only: [:index, :show, :update]
  end

  scope module: 'customer' do
  devise_for :admins
  root to: 'homes#top'
  get 'about' => 'homes#about'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
