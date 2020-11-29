class Task < ApplicationRecord
  TASKS_PARAMS = %i(user_id tasks start_time end_time deadline content level status type_task).freeze

  belongs_to :user
end
