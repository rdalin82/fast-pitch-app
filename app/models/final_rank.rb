class FinalRank < ApplicationRecord
  belongs_to :user, required: false
  belongs_to :presenter, required: false
  has_many :scores
end
