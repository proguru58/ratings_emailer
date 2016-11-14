Rails.application.routes.draw do
  get 'rating_email/index'
  post 'rating_email/send_email'

  devise_for :users
  get 'home/index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "home#index"
end
