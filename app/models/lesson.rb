class Lesson < ActiveRecord::Base
  has_many :lesson_words, dependent: :destroy
  has_many :words, through: :lesson_words
  has_many :word_answers, through: :lesson_words

  belongs_to :user
  belongs_to :category

  accepts_nested_attributes_for :lesson_words
end