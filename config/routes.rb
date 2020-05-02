Rails.application.routes.draw do

  root "welcome#home"
  get '/signin' , to: "sessions#new"
  post '/signin', to: "sessions#create"
  delete '/sessions', to: "sessions#destroy"

  resources :rides
  resources :users
  resources :attractions
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end