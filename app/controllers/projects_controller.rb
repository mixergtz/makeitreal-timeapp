class ProjectsController < ApplicationController
  before_action :redirect_not_logged

  def index
    @projects = Project.all
  end

  def new
    @project = Project.new
  end

  def create
    @project = current_user.projects.new(set_params)
    if @project.save
      render "success"
    else
      render "new"
    end
  end

  def edit
    @project = Project.find(params[:id])
  end

  def update
    @project = Project.find(params[:id])
    if @project.update_attributes(set_params)
      render "success"
    else
      render "edit"
    end
  end

  def destroy
    @project = Project.find(params[:id])
    @project.destroy
    redirect_to projects_path
  end

  private

  def set_params
    params.require(:project).permit(:name)
  end

end
