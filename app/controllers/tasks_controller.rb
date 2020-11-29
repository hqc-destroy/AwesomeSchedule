class TasksController < ApplicationController
  before_action :authenticate_user!

  def new
    @task = Task.new
  end

  def show
    @task = Task.find_by id: params[:id]
    return if @task

    redirect_to root_path
  end

  def create
    @task = Task.new task_params
    if @task.save
      flash[:success] = "Created ! "
    else
      flash[:success] = "Create  Fail! >.<"
      render :new
    end
    redirect_to root_path
  end

  private

  def task_params
    params.require(:task).merge(user_id: current_user.id).permit Task::TASKS_PARAMS
  end
end
