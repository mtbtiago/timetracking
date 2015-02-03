Rails.application.routes.draw do
  # site = controller
  # home = action
  # to create a controller -> rails g controller site
  get '/' => 'site#home'
  get '/contact' => 'site#contact'
  get '/projects' => 'projects#index'
  get '/projects/:id' => 'projects#show'
  get '/projects/:project_id/entries' => 'entries#index'
  # get '/projects/:project_id/entries/:id' => 'entries#show'
end
