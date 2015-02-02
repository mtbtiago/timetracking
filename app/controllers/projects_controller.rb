class ProjectsController < ApplicationController
	# auto created with "rails g controller site"
	# actions will be methods here
	# if controller name == views folder name this is not necessary
	def index
		@projects = Project.limit(10).order("created_at desc")
		# render "index"
	end
end
