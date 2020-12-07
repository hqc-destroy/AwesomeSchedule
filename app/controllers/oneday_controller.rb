class OnedayController < ApplicationController
  before_action :authenticate_user!


  def show
    @day = params[:date]
    @all_tasks = Task.all_task_one_day params[:date]
    @tasks = @all_tasks.page(params[:page]).per(6)
  end
  private

end
