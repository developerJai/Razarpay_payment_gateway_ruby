Rails.application.routes.draw do
  use_doorkeeper do
   skip_controllers :authorizations, :applications,
    :authorized_applications
  end
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  # root "articles#index"
  namespace :api,defaults: { format: 'json' } do
    namespace :v1 do
      post "order/create"=>"payments#order_create"
      post "order/verify"=>"payments#verify_payment"
      post "user/login" => "sessions#login"
      post "user/signup" => "sessions#signup"
   end
  end
end
