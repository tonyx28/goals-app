class AddCompletedToGoal < ActiveRecord::Migration
  def change
    add_column :goals, :completed, :boolean, default: false
    remove_column :goals, :comment
    add_column :goals, :description, :text
  end
end
