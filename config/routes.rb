Rails.application.routes.draw do
  root 'product_feeds#index'

  get 'imports/:id/start', to: 'imports#start', as: :start_import
  get 'imports/:id/process', to: 'imports#process_import', as: :process_import
  resources :imports
  resources :product_feeds
end
