class ChangeColumnNameTableTask < ActiveRecord::Migration[6.0]
  def change
    rename_column :tasks, :start_type, :start_time
  end
end
