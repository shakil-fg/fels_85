class Lesson < ActiveRecord::Base
  belongs_to :user
  belongs_to :category
  has_and_belongs_to_many :words
  has_and_belongs_to_many :word_answers
end