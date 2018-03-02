class Question < ApplicationRecord
  has_many :presenter_questions
  has_many :presenters, through: :presenter_questions

  has_many :presenter_scores
end
