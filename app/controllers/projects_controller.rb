class ProjectsController < ApplicationController
	# auto created with "rails g controller site"
	# actions will be methods here
	# if controller name == views folder name this is not necessary
	def index
		@projects = Project.last_created_projects(10)
		render "no_projects" while @projects.empty?
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

	def new
	  @project = Project.new
	end

	def create
	  @project = Project.new(project_params)

	  if @project.save
	    redirect_to(action: 'index')
	  else
	    render('new')
	  end
	end

	private

	def project_params
	  params.require(:project).permit(:name, :description)
	end

end
