class CreateTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks do |t|
      t.text :title
      t.text :content
      t.date :deadline
      t.string :priority
      t.string :status

      t.timestamps
    end
  end
end
