class AddNumberOfCommentsToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :number_of_comments, :integer, default: 0
  end
end
