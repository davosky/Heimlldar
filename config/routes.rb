Rails.application.routes.draw do
  resources :howtos
  root to: 'dashboard#index'

  get 'dashboard/index'
  get 'dashboard/credits'
  get 'dashboard/authorization'

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  devise_for :users, skip: [:registrations]
  as :user do
    get 'users/edit' => 'devise/registrations#edit', :as => 'edit_user_registration'
    put 'users' => 'devise/registrations#update', :as => 'user_registration'
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  resources :absences do
    collection do
      get :monthly_view
      get :delete_error
      get :list_view
    end
  end
end
