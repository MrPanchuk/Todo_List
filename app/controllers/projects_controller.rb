class ProjectsController < ApplicationController
  before_action :authenticate_user!
  
  def index
    projects = Project.all
    render json: projects
  end

  def create
    project = Project.new(project_params)
    
    if project.save
      render status: 201, json: project
    else
      render status: 409, json: {errors: project.errors}
    end
  end

  def update
    project = Project.find(params[:id])

    if project.update(project_params)
      render json: project 
    else
      render status: 422, json: {errors: project.errors}
    end
  end

  def destroy
    project = Project.find(params[:id])
    project.destroy
    render status: 200, json: { head: :no_content }
  end

  private

  def project_params
    params.require(:project).permit(:name, :user_id)
  end
end
