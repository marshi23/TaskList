Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'tasks#index'

  # resources :tasks do
  #
  #   member do
  #     patch :complete
  #   end
  #
  # end

  get '/tasks', to: 'tasks#index'

  get '/tasks/new', to: 'tasks#new', as: 'new_task'
  post '/tasks', to: 'tasks#create'

  get '/tasks/:id/edit', to: 'tasks#edit', as: 'edit_task'


  patch '/tasks/:id', to: 'tasks#update', as: 'update_task'

  get '/tasks/:id', to: 'tasks#show', as: 'task'

  delete '/tasks/:id', to: 'tasks#destroy'

  patch '/tasks/:id', to: 'task#complete', as: 'complete_task'
end
