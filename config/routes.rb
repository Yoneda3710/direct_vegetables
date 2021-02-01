Rails.application.routes.draw do
  get 'cards/new'
  
  devise_for :customers, controllers: {
    sessions:      'customers/sessions',
    passwords:     'customers/passwords',
    registrations: 'customers/registrations'
  }
  devise_scope :customer do
    get 'addresses', to: 'customers/registrations#new_address'
    post 'addresses', to: 'customers/registrations#create_address'
  end

  devise_for :producers, controllers: {
    sessions:      'producers/sessions',
    passwords:     'producers/passwords',
    registrations: 'producers/registrations'
  }
  devise_scope :producer do
    get 'addresses', to: 'producers/registrations#new_address'
    post 'addresses', to: 'producers/registrations#create_address'
  end

  resources :items
  resources :producers
  resources :cards, only: [:new, :create]
  root to: "items#index"
end
