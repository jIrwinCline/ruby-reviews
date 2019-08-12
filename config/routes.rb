Rails.application.routes.draw do
  root to: 'landing#index'
  get 'usa_only' => "products#usaindex", as: :products_usa

  resources :products do
    resources :reviews#, only: [:index]
  end
end
