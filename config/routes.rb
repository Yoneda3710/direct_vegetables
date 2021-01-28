Rails.application.routes.draw do
  devise_for :producers, controllers: {
    registrations: 'producers/registrations'
  }
  
  devise_for :customers, controllers: {
    registrations: 'customers/registrations'
  }
  devise_scope :customer do
    get 'addresses', to: 'customers/registrations#new_address'
    post 'addresses', to: 'customers/registrations#create_address'
  end
  root to: "items#index"
end
