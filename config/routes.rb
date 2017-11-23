Rails.application.routes.draw do
  use_doorkeeper

  scope :api, module: :api, defaults: { format: :json } do
    devise_for :users, only: %i(passwords registrations), controllers: {
        passwords: 'api/users/passwords',
        registrations: 'api/users/registrations'
    }

    resources :users, only: [:show, :update], module: :users

    scope :v1, module: :v1 do

    end
  end
end
