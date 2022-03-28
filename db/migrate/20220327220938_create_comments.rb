class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.text :edit_history, default: ''
      t.integer :commentable_id
      t.string :commentable_type
      t.references :user, null: false, foreign_key: true
      t.boolean :reply, default: false
      t.integer :comment_number         # comment_number is the number of comments created by the user
                                        # 46posts => post_number = 46th
      t.timestamps
    end
  end
end
