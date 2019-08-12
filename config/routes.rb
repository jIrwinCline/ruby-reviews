Rails.application.routes.draw do
  root to: 'landing#index'
  get 'products/usa_only' => "products#usa", as: :products_usa

  resources :products do

    resources :reviews#, only: [:index]
  end
end
