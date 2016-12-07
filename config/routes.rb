Rails.application.routes.draw do
  get 'notifications/track_email_open'
  get 'notifications/rating_1'
  get 'notifications/rating_2'
  get 'notifications/rating_3'
  get 'notifications/rating_4'
  get 'notifications/rating_5'

  get 'rating_email/index'
  post 'rating_email/send_email'

  resources :templates do
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
