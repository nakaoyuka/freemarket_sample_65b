Rails.application.routes.draw do
  
  root 'tops#index'
  resources :items, only: :show

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
