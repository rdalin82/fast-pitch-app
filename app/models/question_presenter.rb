class QuestionPresenter < ApplicationRecord
  belongs_to :presenter, required: false
  belongs_to :question, required: false
  has_many :scores
end
