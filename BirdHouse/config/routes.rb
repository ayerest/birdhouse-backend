Rails.application.routes.draw do
  # resources :bird_images
  resources :badges
  # resources :bird_entries
  get '/birds' => 'birds#get_categories'
  post '/birds' => 'birds#show_birds'

  # resources :birds, except: [:index]
  resources :images
  resources :field_entries
  resources :users, only: [:create]
  post '/login', to: 'auth#create'
  get '/profile', to: 'users#profile'
  post '/bird_entries', to: 'bird_entries#filter_birds'
  post '/bird_images', to: 'bird_images#get_my_birds'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
