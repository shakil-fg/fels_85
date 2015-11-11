class AddWordIdToWordAnswers < ActiveRecord::Migration
  def change
    add_column :word_answers, :word_id, :integer
    add_index :word_answers, :word_id
  end
end
