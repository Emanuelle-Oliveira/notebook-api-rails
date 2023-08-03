Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'

  resources :auths, only: [:create]

  resources :kinds

  # scope module: 'v1' do
  # api_version(:module => 'V1', :parameter => {:name => 'version', :value => '1'}) do
  # api_version(:module => 'V1', :header => {:name => 'Accept', :value => 'application/vdn.api+json; version=1'}) do
  # constraints subdomain: 'V1' do
  # scope module: 'v1' do
  # api_version(:module => 'V1', :header => {:name => 'X-Version', :value => '1.0'}) do
  api_version(:module => 'V1', :path => {:value => 'v1'}) do
    resources :contacts do # , :constraints => lambda { |request| request.params[:version] == '1' } do
      resource :kind, only: [:show] # contacts/1/kind
      resource :kind, only: [:show], path: 'relationships/kind'

      resource :phones, only: [:show] # contacts/1/phones
      resource :phones, only: [:show], path: 'relationships/phones'

      resource :phone, only: %i[update create destroy] # contacts/1/phone/1
      resource :phone, only: %i[update create destroy], path: 'relationships/phone'

      resource :address, only: %i[show update create destroy] # contacts/1/address
      resource :address, only: %i[show update create destroy], path: 'relationships/address'
    end
  end

  # scope module: 'v2' do
  # api_version(:module => 'V2', :parameter => {:name => 'version', :value => '2'}) do
  # api_version(:module => 'V2', :header => {:name => 'Accept', :value => 'application/vdn.api+json; version=2'}) do
  # api_version(:module => 'V2', :header => {:name => 'X-Version', :value => '2.0'}) do
  api_version(:module => 'V2', :path => {:value => 'v2'}) do
    resources :contacts do # , :constraints => lambda { |request| request.params[:version] == '2' } do
      resource :kind, only: [:show] # contacts/1/kind
      resource :kind, only: [:show], path: 'relationships/kind'

      resource :phones, only: [:show] # contacts/1/phones
      resource :phones, only: [:show], path: 'relationships/phones'

      resource :phone, only: %i[update create destroy] # contacts/1/phone/1
      resource :phone, only: %i[update create destroy], path: 'relationships/phone'

      resource :address, only: %i[show update create destroy] # contacts/1/address
      resource :address, only: %i[show update create destroy], path: 'relationships/address'
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
