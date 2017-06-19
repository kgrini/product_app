Rails.application.routes.draw do
  root 'dashboard#index'

  resources :imports
  resources :product_feeds
end
