Rails.application.routes.draw do
  get 'client/index'
  get 'admin/index'

  resources :benefits
  resources :emp_details

  devise_for :users, controllers: {
    registrations: 'users/registrations' # Use the full namespace here
  }

  devise_scope :user do
    authenticated :user do
      root 'admin#index', as: :authenticated_root
    end

    unauthenticated do
      root 'devise/sessions#new', as: :unauthenticated_root
    end
  end
end
