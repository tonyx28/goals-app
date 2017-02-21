class ChangeCommentStructure < ActiveRecord::Migration
  def change
    drop_table :goal_comments
    drop_table :user_comments

    create_table :comments do |t|
      t.text :body, null: false
      t.integer :commenter_id, null: false
      t.integer :commentable_id, null: false
      t.string :commentable_type, null: false

      t.timestamps null: false
    end
    add_index :comments, :commenter_id
    add_index :comments, :commentable_id
  end
end
