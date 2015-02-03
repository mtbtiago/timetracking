class EntriesController < ApplicationController
  def index
    begin
      @project = Project.find(params[:project_id])
      @entries = @project.entries.where("extract(month from date) = extract(month from current_date)")
      @hours = @project.calc_total_hours(Date.new.year,Date.new.month)
    rescue
      render "no_projects_found"
    end
  end

  # def show
  #   # @project = Project.where("id = ?",params[:id]).first
  #   begin
  #     # @project = Project.find_by(params[:id]) # returns nil
  #     @project = Project.find(params[:id]) # raises an exception
  #   rescue
  #     render "no_projects_found"
  #   end
  # end

end
