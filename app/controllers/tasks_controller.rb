class TasksController < ApplicationController
  before_action :authenticate_user!
  before_action :list_tasks, only: :index

  def index
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
    if (!(request.referrer&.include? "edit"))
      @task = Task.find_by id: params[:id]
      @task.update_attribute :status, params[:status]
      redirect_to root_path
    else
      @task = Task.find_by id: params[:id]
      if @task.update task_params
        flash[:success] = "Edit success"
        redirect_to task_path @task
      else
        flash.now[:danger] = "edit fail"
        render :edit
      end
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

  def list_tasks
    @q = current_user.tasks.ransack params[:q]
    @all_tasks = @q.result
    if params[:start_time]!= nil && params[:start_time] != ""
      @all_tasks = @all_tasks.all_task_one_day params[:start_time]
      @day = params[:start_time].to_date()
    else
      @day = Time.now
      @all_tasks = @all_tasks.all_task_one_day @day.to_date().to_s
    end
    @tasks = @all_tasks.page(params[:page]).per(6)
  end

end
