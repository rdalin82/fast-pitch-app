class Question < ApplicationRecord
  has_many :presenters, through: :question_presenter
  has_many :scores
end
