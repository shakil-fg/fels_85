class CreateLessons < ActiveRecord::Migration
  def change
    create_table :lessons do |t|
      t.integer :result, default: 0

      t.timestamps null: false
    end
  end
end