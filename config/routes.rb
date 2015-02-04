Rails.application.routes.draw do
  # site = controller
  # home = action
  # to create a controller -> rails g controller site

  get '/' => 'site#home'
  resources :projects do
    resources :entries
  end

  # get '/' => 'site#home'
  # get '/contact' => 'site#contact'
  # get '/projects' => 'projects#index'
  # get '/projects/:id' => 'projects#show'
  # get '/projects/:project_id/entries' => 'entries#index', as: 'project_entries'
  # get '/projects/:project_id/entries/new' => 'entries#new'
  # post '/projects/:project_id/entries' => 'entries#create'

  # get '/projects/:project_id/entries/:id' => 'entries#show'
end
