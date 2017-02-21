class AddIndices < ActiveRecord::Migration
  def change
    add_index :goals, :title
  end
end
