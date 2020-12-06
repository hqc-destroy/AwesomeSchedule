class Task < ApplicationRecord
  TASKS_PARAMS = %i(user_id tasks start_time end_time deadline content level status type_task).freeze

  belongs_to :user
  scope :day, -> (start_date) {where("Date(start_time) = ?", start_date).order("status ASC")}
  class << self
    def all_task_one_day day
      return Task.day day
    end
  end
end
