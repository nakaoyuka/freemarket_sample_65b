Rails.application.routes.draw do
  
  devise_for :users
  
  resources :signup do
    collection do
      get 'registration'
      get 'sms_confirmation'
      # get 'sms_confirmation/sms', to: 'signup#sms_confirmation_sms'
      get 'address'
      get 'done'
    end
  end
  
  # ルート指定
  root 'tops#index'
  
  # ユーザーページのルーティング
  resources :users do
    resource :self_address
    resources :delivery_addresses
  end

  # 商品ページのルーティング
  resources :items do
    resources :likes
    resources :comments
    resources :images
    collection do
      get 'confirm'
    end
  end

  # カード登録ページのルーティング
  resources :cards
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
