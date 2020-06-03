Rails.application.routes.draw do

  #root route
  root to: 'application#home'

  resources :comments
  resources :photos
  resources :users, except: [:new]


   #signing up 
   get '/signup', to: 'users#new'
   post'/signup', to: 'users#create'

   #logging in 
   get '/login', to: 'sessions#new'
   get '/show', to: 'sessions#show'
   get '/error', to: 'sessions#error'
   post '/login', to: 'sessions#create'
   delete '/logout', to: 'sessions#destroy'

 
 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
