class Word < ActiveRecord::Base
  has_many :word_answers, dependent: :destroy
  has_many :lesson_words
  has_many :lessons, through: :lesson_words
  belongs_to :category

  belongs_to :user

  validates :content,  presence: true
  learned_word_ids = "SELECT lesson_words.word_id FROM lesson_words, lessons WHERE lessons.user_id = :user_id AND lessons.id = lesson_words.lesson_id AND lesson_words.word_answer_id IS NOT NULL"
  scope :learned_words, ->user {where "id IN (#{learned_word_ids})", user_id: user.id}
  scope :not_learned_words, ->user {where "id NOT IN (#{learned_word_ids})", user_id: user.id}
  scope :filter_category, ->category_id {where category_id: category_id if category_id.present?}
end