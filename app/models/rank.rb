class Rank < ApplicationRecord
  belongs_to :presenter, required: false
  belongs_to :user, required: false
end
