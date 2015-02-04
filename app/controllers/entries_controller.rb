class EntriesController < ApplicationController
  def index
    begin
      @project = Project.find(params[:project_id])
      @entries = @project.entries.where("extract(month from date) = extract(month from current_date)")
      @total_month_hours = @project.calc_total_hours(Date.today.year,Date.today.month)
    rescue
      render "no_projects_found"
    end
  end

  def new
    @project = Project.find(params[:project_id])
    @entry = @project.entries.new
  end

  def create
    @project = Project.find(params[:project_id])
    @entry = @project.entries.new(new_entry_params)

    if @entry.save
      redirect_to(action: 'index')
      flash[:notice] = "Entry created sccessfully"
    else
      flash[:error] = "Please, check errors"
      render('new')
      # render "your_crap"
    end
  end

  def edit
    @project = Project.find(params[:project_id])
    @entry = @project.entries.find(params[:id])
  end

  def update
    @project = Project.find(params[:project_id])
    @entry = @project.entries.find(params[:id])
    @entry.update_attributes(edit_entry_params)

    if @entry.save
      redirect_to(action: 'index')
    else
      render('edit')
    end
  end

  def destroy
    @project = Project.find(params[:project_id])
    @entry = @project.entries.find(params[:id])
    @entry.destroy
    redirect_to(action: 'index')
  end

  def show
    @project = Project.find(params[:project_id])
    @entry = @project.entries.find(params[:id])
  end

  private

  def new_entry_params
    params.require(:entry).permit(:hours, :minutes, :date)
  end

  def edit_entry_params
    params.require(:entry).permit(:hours, :minutes, :date, :comments)
  end

end
