Rails.application.routes.draw do
  get 'client/index'
  get 'admin/index'

  resources :benefits
  resources :emp_details

  devise_for :users, controllers: {
    registrations: 'users/registrations' # Use the full namespace here
  }
end
