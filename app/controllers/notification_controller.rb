class NotificationController < ApplicationController
  before_action :authenticate_user!
  def index
    @task = current_user.tasks
    @day = Time.now.to_date().to_s
    @task_fails = @task.out_time @day
    @tasks = @task.con_time @day

  end
end
