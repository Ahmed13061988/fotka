Rails.application.routes.draw do
  root "sessions#home"

  get '/signup' => 'users#new'
  post '/signup' => 'users#create'
  
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  
  delete '/logout' => 'sessions#destroy'
  
  get '/auth/google_oauth2/callback' => 'sessions#google'

  
 
  
  resources :users  
  resources :photos  do 
     resources :comments, only: [:new, :create, :show, :index]
  end 
  resources :comments
 

  


  #  #signing up 
  #  get '/signup', to: 'users#new'
  #  post'/signup', to: 'users#create'

  #  #logging in 
  #  get '/login', to: 'sessions#new'
  #  get '/error', to: 'sessions#error'
  #  post '/login', to: 'sessions#create'
  #  delete '/logout', to: 'sessions#destroy'

 
 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
