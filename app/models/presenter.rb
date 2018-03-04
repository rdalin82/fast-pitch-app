class Presenter < ApplicationRecord
  has_many :questions, through: :question_presenter
  has_many :comments
  has_many :scores
end
