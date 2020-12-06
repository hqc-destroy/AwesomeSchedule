class OnedayController < ApplicationController
  before_action :authenticate_user!
  def show
     @tasks = Task.all_task_one_day params[:date]
  end
end
