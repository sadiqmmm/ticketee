class ProjectsController < ApplicationController
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
      flash[:notice] = 'Project created successfully.'
      redirect_to @project
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @project.update(project_params)
      flash[:notice] = 'Project updated successfully'
      redirect_to @project
    else
      render 'edit'
    end
  end

  def destroy
    @project.destroy
    flash[:notice] = 'Project destroyed successfully'
    redirect_to projects_path
  end

  private
    def project_params
      params.require(:project).permit(:name, :description)
    end

    def set_project
      @project = Project.find(params[:id])
    end
end