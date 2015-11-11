class WordAnswer < ActiveRecord::Base
  belongs_to :word
  has_and_belongs_to_many :lessons

  validates :content,  presence: true
end