Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/' => 'pages#home'
  get '/pages/index' => 'pages#index'
  get '/pages/csv' => 'pages#csv'

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

  get '/scores/new/:id' => 'scores#new'
  post '/scores' => 'scores#create'
  get '/scores/:id/edit' => 'scores#edit'
  patch '/scores/update' => 'scores#update'
  delete '/scores/:id' => 'scores#destroy'

  get '/comments' => 'comments#index'
  get '/comments/new/:id' => 'comments#new'
  post '/comments' => 'comments#create'
  get '/comments/:id/edit' => 'comments#edit'
  patch '/comments/:id' => 'comments#update'
  delete '/comments/:id' => 'comments#destroy'

  get '/final_ranks' => 'final_ranks#index'
  get '/final_ranks/new/:id' => 'final_ranks#new'
  post '/final_ranks' => 'final_ranks#create'
  get '/final_ranks/:id/edit' => 'final_ranks#edit'
  patch '/final_ranks/:id' => 'final_ranks#update'
  delete '/final_ranks/:id' => 'final_ranks#destroy'
end
