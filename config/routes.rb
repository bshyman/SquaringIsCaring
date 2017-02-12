Rails.application.routes.draw do
  get 'users/dashboard'

  devise_for :admins
  # devise_for :users, controllers: {omniauth_callbacks: "users/omniauth_callbacks"} 
  # devise_for :users, controllers: {omniauth_callbacks: "omniauth_callbacks" }

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users, :controllers => { registrations: 'registrations' }

  resources :users
  
  resources :contests do
  	resources :cells, except: [:index]
  end

  get '/users/:id/dashboard', to: 'users#dashboard', as: 'dashboard'
  get '/contests/:id/box_score', to: 'contests#box_score', as: 'box_score'
  get '/contests/:id/display_owners', to: 'contests#display_owners'
  get '/pages/landing', to: 'pages#landing', as: 'landing'

  root to: 'pages#landing'
end