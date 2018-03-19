class FinalRank < ApplicationRecord
  belongs_to :user, required: false
  belongs_to :presenter, required: false

  validates :final_rank, numericality: { only_integer: true, greater_than: 0, message:'Number must be greater than 0'}
end
