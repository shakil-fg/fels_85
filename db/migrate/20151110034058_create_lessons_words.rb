class CreateLessonsWords < ActiveRecord::Migration
  def change
    create_table :lessons_words do |t|
      t.integer :lesson_id
      t.integer :word_id
    end
  end
end
