class TasksController < ApplicationController
  before_action :authenticate_user!

  def create
    head 401 unless current_user
    @task = Task.new(task_params)
    
    if @task.save
      redirect_to root_path
    else
      render status: 409, json: {errors: @task.errors}
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

    redirect_to root_path
  end

  private

  def task_params
    params.require(:task).permit(:name, :project_id, :status)
  end
end
