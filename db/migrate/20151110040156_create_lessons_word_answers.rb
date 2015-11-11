class CreateLessonsWordAnswers < ActiveRecord::Migration
  def change
    create_table :lessons_word_answers do |t|
      t.integer :lesson_id
      t.integer :word_answer_id
    end
  end
end
