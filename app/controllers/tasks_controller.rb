class TasksController < ApplicationController
  before_action :authenticate_user!
  before_action :check_user

  def create
    @task = Task.new(task_params)
    
    if @task.save
      redirect_to root_path
    else
      render status: 409, json: {errors: @task.errors}
    end
  end

  def update
    task = Task.find(params[:id])
    head 401 unless current_user.id == task.project.user_id

    if task.update(task_params)
      redirect_to root_path
    else
      render status: 422, json: {errors: task.errors}
    end
  end

  def destroy
    task = Task.find(params[:id])
    head 401 unless current_user.id == task.project.user_id

    task.destroy
    redirect_to root_path
  end

  private

  def task_params
    params.require(:task).permit(:name, :project_id, :status)
  end
end
