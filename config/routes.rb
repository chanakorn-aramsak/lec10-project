Rails.application.routes.draw do
  resources :inventories
  resources :items
  resources :users
  get 'main/login'
  get 'main/create'
  get 'main/user_Item'
  get 'shop/:id', to: 'shop#shopId'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get '/inventories/buy/:id/:shopID', to: 'inventories#buy'
  get 'main/inventories'
  get 'main/destroyItem/:id', to: 'main#destroyItem'
  # Defines the root path route ("/")
  # root "articles#index"
end
