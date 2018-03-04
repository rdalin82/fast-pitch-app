class QuestionPresenter < ApplicationRecord
  belongs_to :question, required: false
  belongs_to :presenter, required: false
end
