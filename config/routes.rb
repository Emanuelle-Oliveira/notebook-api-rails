Rails.application.routes.draw do
  resources :kinds

  resources :contacts do
    resource :kind, only: [:show] # contacts/1/kind
    resource :kind, only: [:show], path: 'relationships/kind'

    resource :phones, only: [:show] # contacts/1/phones
    resource :phones, only: [:show], path: 'relationships/phones'

    resource :address, only: %i[show update create destroy] # contacts/1/address
    resource :address, only: %i[show update create destroy], path: 'relationships/address'
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
