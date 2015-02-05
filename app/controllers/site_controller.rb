class SiteController < ApplicationController
	# auto created with "rails g controller site"
	# actions will be methods here
	# if controller name == views folder name this is not necessary
  def home
    @projects = Project.last_created_projects(10)
  end
end
