class CreateUserComments < ActiveRecord::Migration
  def change
    create_table :user_comments do |t|
      t.text :body, null: false
      t.integer :commenter_id, null: false
      t.integer :commented_on_id, null: false

      t.timestamps null: false
    end
    add_index :user_comments, :commenter_id
    add_index :user_comments, :commented_on_id
  end
end
