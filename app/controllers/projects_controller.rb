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
    @project = Project.new(new_project_params)

    if @project.save
      redirect_to(action: 'index')
      flash[:notice] = "Project created sccessfully"
    else
      flash[:error] = "Please, check errors"
      render('new')
    end
  end

  def edit
    @project = Project.find(params[:id])
  end

  def update
    @project = Project.find(params[:id])
    @project.update_attributes(edit_project_params)

    if @project.save
      flash[:notice] = "Data updated sccessfully"
      redirect_to(action: 'index')
    else
      flash[:error] = "Please, check errors"
      render('edit')
    end
  end

  def destroy
    @project = Project.find(params[:id])
    @project.destroy
    redirect_to(action: 'index')
  end

  private

  def new_project_params
    params.require(:project).permit(:name, :description, :logo)
  end

  def edit_project_params
    params.require(:project).permit(:name, :description, :logo)
  end

end
