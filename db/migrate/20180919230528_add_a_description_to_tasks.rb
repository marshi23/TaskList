class AddADescriptionToTasks < ActiveRecord::Migration[5.2]
  def change
    add_column :tasks, :description, :string
  end
end
