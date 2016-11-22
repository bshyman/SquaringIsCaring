Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :contests 
  resources :squares

  root to: 'contests#index'
end
