Rails.application.routes.draw do
  # resources :bird_images
  # resources :badges
  # resources :bird_entries
  get '/birds' => 'birds#get_categories'
  post '/birds' => 'birds#show_birds'
  get '/birds/:id' => 'birds#show'

  # resources :birds, except: [:index]
  # resources :images
  resources :field_entries
  resources :users, only: [:create]
  post '/login', to: 'auth#create'
  post '/entries', to: 'entries#get_my_entries'
  get '/profile', to: 'users#profile'
  post '/bird_entries', to: 'bird_entries#filter_birds'
  post '/bird_images', to: 'bird_images#get_my_birds'
  post '/badges', to: 'badges#get_my_badges'
  post '/images', to: 'images#get_my_photos'
  post '/steps', to: 'steps#get_my_steps'
  post '/my_steps', to: 'my_steps#update_steps'
  post '/shared_entries', to: 'shared_entries#get_shared_entries'
  post '/push_token', to: 'push_token#push_token'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
