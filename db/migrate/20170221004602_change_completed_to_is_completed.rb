class ChangeCompletedToIsCompleted < ActiveRecord::Migration
  def change
    rename_column :goals, :completed, :is_completed
  end
end
