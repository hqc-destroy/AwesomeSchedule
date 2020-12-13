class Task < ApplicationRecord
  TASKS_PARAMS = %i(user_id tasks start_time end_time deadline content level status type_task).freeze

  belongs_to :user
  scope :day, -> (start_date) {where("Date(start_time) = ?", start_date).order("status ASC").order("level DESC").order("start_time ASC").order("type_task ASC")}
  scope :where_status, ->(status)  {where("status < ?", status)}
  scope :notifica, ->(today)  {where("Date(start_time) <= ?", today)}
  scope :con_date, -> (today) {where("Date(end_time) >= ?", today).order("start_time ASC").order("status ASC").order("level DESC").order("type_task ASC")}
  scope :out_date, -> (today) {where("Date(end_time) <= ?", today).order("start_time ASC").order("status ASC").order("level DESC").order("type_task ASC")}
  class << self
    def all_task_one_day day

      return Task.day day
    end
    def con_time day
      return  Task.where_status(2).notifica(day).con_date(day)
    end

    def out_time day
      return Task.where_status(2).out_date(day)
    end
  end
end
