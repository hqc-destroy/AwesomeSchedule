class AddTypeToTask < ActiveRecord::Migration[6.0]
  def change
    add_column :tasks, :type, :string
  end
end
