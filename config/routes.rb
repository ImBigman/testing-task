Rails.application.routes.draw do
  root to: 'projects#index'

  get '/projects', to: 'projects#index'
  post '/todos', to: 'todos#create'
  patch '/projects/:id/todos/:id', to: 'todos#update'
end
