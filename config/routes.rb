Rails.application.routes.draw do
  devise_for :customers, controllers: {
    registrations: 'user/registrations'
  }
  devise_scope :customer do
    get 'addresses', to: 'customers/registrations#new_address'
    post 'addressesa', to: 'customers/registrations#create_address'
  end
  root to: "items#index"
end
