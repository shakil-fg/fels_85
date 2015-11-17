class WordAnswer < ActiveRecord::Base
  has_many :lesson_words
  has_many :lessons, through: :lesson_words
  belongs_to :word

  validates :content,  presence: true

  scope :correct, -> { where(correct: true) }
  scope :correct_content, -> { correct.first.content }
end