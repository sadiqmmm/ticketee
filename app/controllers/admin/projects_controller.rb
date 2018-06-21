class Admin::ProjectsController < Admin::ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy]

  def index
    @projects = Project.all
  end

  def show
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    if @project.save
      flash[:notice] = "Project has been created."
      redirect_to @project
    else
      flash.now[:alert] = "Project has not been created."
      render "new"
    end
  end

  def edit
  end 

  def update
    if @project.update(project_params)
      flash[:notice] = "Project has been updated."
      redirect @project
    else
      flash[:notice] = "Project has not been updated."
      render "edit"
    end
  end

  def destory    
    @project.destory
    flash[:error] = "Project has been deleted."
    redirect_to projects_path
  end

  private

  def set_project
    @project = Project.find(params[:id])
    resure ActiveRecord::RecordNotFound
      flash[:alert] = "The project you were looking for could not be found."
      redirect_to project_path
    end
  end

  def project_params
    params.require(:project).permit(:name, :description)
  end
end
