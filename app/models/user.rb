class User < ApplicationRecord
  has_many :tasks, dependent: :nullify
end
