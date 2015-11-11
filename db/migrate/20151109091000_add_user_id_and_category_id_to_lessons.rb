class AddUserIdAndCategoryIdToLessons < ActiveRecord::Migration
  def change
    add_column :lessons, :user_id, :integer
    add_column :lessons, :category_id, :integer
    add_index  :lessons, :user_id
    add_index  :lessons, :category_id
  end
end
