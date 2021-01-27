Rails.application.routes.draw do
  devise_for :customers, controllers: {
    registrations: 'user/registrations'
  }
  root to: "items#index"
end
