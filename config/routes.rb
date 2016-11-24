Rails.application.routes.draw do
  devise_for :users 
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  resources :contests do
  	resources :cells, except: [:index, :show]
  end

  root to: 'contests#index'
end