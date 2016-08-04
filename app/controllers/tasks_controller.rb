class TasksController < ApplicationController
  before_action :authenticate_user!
  
  def index
    tasks = Project.all

    render json: projects
  end

  def create
    task = Task.new(task_params)
    
    if task.save
      render status: 201, json: task
    else
      render status: 409, json: {errors: task.errors}
    end
  end

  def update
    task = Task.find(params[:id])

    if task.update(project_params)
      render json: task 
    else
      render status: 422, json: {errors: task.errors}
    end
  end

  def destroy
    task = Task.find(params[:id])
    task.destroy

    render status: 200, json: { head: :no_content }
  end

  private

  def task_params
    params.require(:task).permit(:name, :project_id, :status)
  end
end
