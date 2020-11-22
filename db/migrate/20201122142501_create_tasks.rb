class CreateTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks do |t|
      t.references :user, null: false, foreign_key: true
      t.string :tasks
      t.datetime :start_type
      t.datetime :end_time
      t.datetime :deadline
      t.string :content
      t.string :level
      t.string :status

      t.timestamps
    end
  end
end
