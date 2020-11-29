class ChangeColumnTypeTableTask < ActiveRecord::Migration[6.0]
  def change
    rename_column :tasks, :type, :type_task
  end
end
