Rails.application.routes.draw do
  
  # Added by Koudoku.
  mount Koudoku::Engine, at: 'koudoku'
  scope module: 'koudoku' do
    get 'pricing' => 'subscriptions#index', as: 'pricing'
  end

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  get 'notifications/track_email_open'
  get 'notifications/member/:member/rating/:stars/:token' => 'notifications#rating', :as => 'notifications_rating'

  get 'rating_email/index'
  post 'rating_email/send_email'

  resources :templates do
    get 'fetch'
  end

  resources :sender_addresses do
    get 'fetch'
  end

  resources :messages do
    get 'fetch'
  end

  devise_for :users
  get 'home/index'

  get "assets/email/:filename/*message_token_id" => 'notifications#track_email_open', :as => 'email_tracking_image'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "home#index"
end
