Rails.application.routes.draw do
  root 'logged_out#index'

  get 'profile' => "parties#new"
  resources :parties, only: [:new, :create]

  resources :accounts, only: [:new, :create, :edit, :update]
  resource :session, only: [:new, :create, :destroy]
  resources :password_resets, only: [:new, :create, :edit, :update]

  get 'my_account' => 'logged_in#landing'

  namespace :admin do
    get '/' => 'admin#index'
    resources :accounts
    resources :roles
    resources :parties
  end

  get '*path' => redirect('/')
end
