class Question < ApplicationRecord
  has_many :presenters, through: :question_presenter
  belongs_to :users
  has_many :scores
end
