class RemoveDefaultFromPrivate < ActiveRecord::Migration
  def change
    remove_column :goals, :private
    add_column :goals, :is_private, :boolean
  end
end
