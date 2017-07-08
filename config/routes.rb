Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :items
      resources :tags, only: [:index, :search, :show, :create, :destroy] do
        get '/items' => 'tags#search'
      end
      resources :collection_items
      resources :collections, only: [:index, :create, :show, :destroy]
    end
  end
end
