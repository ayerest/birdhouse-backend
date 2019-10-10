Rails.application.routes.draw do
  resources :bird_images
  resources :badges
  resources :bird_entries
  get '/birds' => 'birds#index'

  # resources :birds, except: [:index]
  resources :images
  resources :field_entries
  resources :users, only: [:create]
  post '/login', to: 'auth#create'
  get '/profile', to: 'users#profile'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
