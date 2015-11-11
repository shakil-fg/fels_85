class Word < ActiveRecord::Base
  belongs_to :category
  has_many :word_answers, dependent: :destroy

  has_and_belongs_to_many :lessons

  validates :content,  presence: true
end