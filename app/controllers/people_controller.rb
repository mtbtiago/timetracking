class PeopleController < ApplicationController
  def index
    @people = Person.all
  end

  def show
    @person = Person.find(params[:id]) # raises an exception

    #### complicated version, don't use ####
    assigned_projects = @person.projects.all.map {|project| project.id}
    @available_projects = Hash[Project.all.map {|project| [project.id,'']}]
    @all_projects = Hash[Project.all.map {|project| [project.id,project.full_name]}]
    # Show checked projects already assigned
    @available_projects.each {|k,v|
      @available_projects[k] = 'X' if assigned_projects.include?(k)
    }
    #### complicated version, don't use ####
  end

  def new
    @person = Person.new
  end

  def create
    @person = Person.new(new_params)

    if @person.save
      redirect_to(action: 'index')
      flash[:notice] = "Person created sccessfully"
    else
      flash[:error] = "Please, check errors"
      render('new')
    end
  end

  def edit
    @person = Person.find(params[:id])
  end

  def update
    @person = Person.find(params[:id])
    @person.update_attributes(edit_params)

    if @person.save
      flash[:notice] = "Data updated sccessfully"
      redirect_to(action: 'index')
    else
      flash[:error] = "Please, check errors"
      render('edit')
    end
  end

  def destroy
    @person = Person.find(params[:id])
    @person.destroy
    redirect_to(action: 'index')
  end

  private

  def new_params
    params.require(:person).permit(:name, :description, :logo)
  end

  def edit_params
    params.require(:person).permit(:name, :description, :logo)
  end
end
