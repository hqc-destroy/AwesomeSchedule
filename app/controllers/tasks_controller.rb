class TasksController < ApplicationController
  before_action :authenticate_user!

  def index
    @tasks = current_user.tasks

    return if @tasks

    redirect_to root_path
  end

  def new
    @task = Task.new
  end

  def show
    @task = Task.find_by id: params[:id]
    return if @task

    redirect_to root_path
  end

  def edit
    @task = Task.find_by id: params[:id]
  end

  def update
    @task = Task.find_by id: params[:id]
    if @task.update task_params
      flash[:success] = "Edit success"
      redirect_to task_path @task
    else
      flash.now[:danger] = "edit fail"
      render :edit
    end
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

  def destroy
    @task = Task.find_by id: params[:id]
    if @task.destroy
      flash[:success] = "delete success"
    else
      flash[:error] = "delete failed"
    end

    redirect_to tasks_url
  end

  private

  def task_params
    params.require(:task).merge(user_id: current_user.id).permit Task::TASKS_PARAMS
  end
end
