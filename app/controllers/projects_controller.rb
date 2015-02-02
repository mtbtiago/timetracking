class ProjectsController < ApplicationController
	# auto created with "rails g controller site"
	# actions will be methods here
	# if controller name == views folder name this is not necessary
	def index
		@projects = Project.last_created_projects(10)
		if @projects.empty?
			render "no_projects"
		end
		# 
		# or
		# 
		# @projects = Project.order("created_at desc").limit(10)
		# render "index" ## is not necessary, the convention rules
	end

	def show
		# @project = Project.where("id = ?",params[:id]).first
		begin
			# @project = Project.find_by(params[:id]) # returns nil
			@project = Project.find(params[:id]) # raises an exception
		rescue
			render "no_projects_found"
		end
	end
end
