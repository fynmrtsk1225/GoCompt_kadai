class AddNullToTasks < ActiveRecord::Migration[6.0]
  def change
    change_column_null :tasks, :title, false
    change_column_null :tasks, :content, false
    change_column_null :tasks, :priority, false
    change_column_null :tasks, :status, false
  end
end
