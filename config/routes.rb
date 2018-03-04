Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/' => 'pages#home'

  get '/signup' => 'users#new'
  post '/users' => 'users#create'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  get '/presenters' => 'presenters#index'
  get '/presenters/new' => 'presenters#new'
  post '/presenters' => 'presenters#create'
  get '/presenters/:id' => 'presenters#show'
  get '/presenters/:id/edit' => 'presenters#edit'
  patch '/presenters/:id' => 'presenters#update'
  delete '/presenters/:id' => 'presenters#destroy'

  get '/questions' => 'questions#index'
  get '/questions/new' => 'questions#new'
  post '/questions' => 'questions#create'
  get '/questions/:id' => 'questions#show'
  get '/questions/:id/edit' => 'questions#edit'
  patch '/questions/:id' => 'questions#update'
  delete '/questions/:id' => 'questions#destroy'

  get '/scores' => 'scores#index'
  get '/scores/new/:id' => 'scores#new'
  post '/scores' => 'scores#create'
  get '/scores/:id' => 'scores#show'
  get '/scores/:id/edit' => 'scores#edit'
  patch '/scores/:id' => 'scores#update'
  delete '/scores/:id' => 'scores#destroy'

end
