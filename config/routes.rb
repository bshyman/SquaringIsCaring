Rails.application.routes.draw do
  get 'users/dashboard'

  devise_for :admins
  # devise_for :users, controllers: {omniauth_callbacks: "users/omniauth_callbacks"} 
  # devise_for :users, controllers: {omniauth_callbacks: "omniauth_callbacks" }

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users, :controllers => { registrations: 'registrations' }

  
  resources :contests do
  	resources :cells, except: [:index, :show]
  end

  get '/users/:id/dashboard', to: 'users#dashboard', as: 'dashboard'

  root to: 'contests#index'
end