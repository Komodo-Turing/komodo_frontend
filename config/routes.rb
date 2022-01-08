Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'

  post '/auth/google_oauth2/callback', to: "sessions#create"
  get '/dashboard', to: "dashboard#index"

  get '/users/edit', to: "users#edit"
  patch '/users', to: "users#update"
  get '/logout', to: 'sessions#destroy' #there is no link for this yet

  get '/timers/new', to: 'timers#new'
  post '/timers', to: 'timers#create'
  get '/timers', to: 'timers#show'
end
