class ProjectsController < ApplicationController
  before_action :authenticate_user!

  def create
    head 401 unless current_user
    new_proj_params = project_params
    new_proj_params[:user_id] = current_user.id
    @project = Project.new(new_proj_params)
    
    if @project.save
      redirect_to root_path
    else
      render status: 409, json: {errors: @project.errors}
    end
  end

  def update
    head 401 unless current_user
    project = Project.find(params[:id])
    head 401 unless current_user.id == project.user_id

    if project.update(project_params)
      redirect_to root_path
    else
      render status: 422, json: {errors: project.errors}
    end
  end

  def destroy
    head 401 unless current_user
    project = Project.find(params[:id])
    head 401 unless current_user.id == project.user_id

    project.destroy
    redirect_to root_path
  end

  private

  def project_params
    params.require(:project).permit(:name, :user_id)
  end
end
