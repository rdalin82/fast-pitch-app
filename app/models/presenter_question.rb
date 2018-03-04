class PresenterQuestion < ApplicationRecord
  belongs_to :presenter
  belongs_to :question
  has_many :scores
end
