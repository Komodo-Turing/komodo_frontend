Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'

  get '/auth/google_oauth2/callback', to: "sessions#create"
  get '/o/oauth2/auth', to: "sessions#create"

  get '/dashboard', to: "dashboard#index"

  get '/contacts/new', to: "contacts#new"
  post '/dashboard', to: "contacts#create"

  get "/contacts/:id/edit", to: "contacts#edit"
  patch "/contacts/:id", to: "contacts#update"
  delete "/contacts/:id", to: "contacts#destroy"


  get '/users/edit', to: "users#edit"
  patch '/users', to: "users#update"
  get '/logout', to: 'sessions#destroy' #there is no link for this yet

  get '/timers/new', to: 'timers#new'
  post '/timers', to: 'timers#create'

  get '/timers/:id', to: 'timers#show'
  get '/timers/:id/edit', to: 'timers#edit'

  patch '/timers/:id', to: 'timers#update'

  delete '/timers/:id/delete', to: 'timers#destroy'


  get '/active_timers/:id', to: 'active_timers#show'
  patch '/active_timers/:id', to: 'active_timers#update'
  post '/active_timers', to: 'active_timers#create'
end