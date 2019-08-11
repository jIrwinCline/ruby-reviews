Rails.application.routes.draw do
  root to: 'landing#index'
  get '/usa_products' => "usa_products#get", as: :usa_products
  resources :products do

    resources :reviews#, only: [:index]
  end
end
