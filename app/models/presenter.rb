class Presenter < ApplicationRecord
  has_many :presenter_questions
  has_many :questions, through: :presenter_questions
end
