Rails.application.routes.draw do
  get 'cards/new'
  
  devise_for :customers, controllers: {
    registrations: 'customers/registrations'
  }
  devise_scope :customer do
    get 'addresses', to: 'customers/registrations#new_address'
    post 'addresses', to: 'customers/registrations#create_address'
  end

  devise_for :producers, controllers: {
    registrations: 'producers/registrations'
  }
  devise_scope :producer do
    get 'producer_addresses', to: 'producers/registrations#new_producer_address'
    post 'producer_addresses', to: 'producers/registrations#create_producer_address'
  end

  resources :items do
    post 'order', on: :member
  end

  resources :producers do
    resources :profiles
  end
  resources :customers
  resources :cards, only: [:new, :create]
  root to: "items#index"
end
