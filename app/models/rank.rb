class Rank < ApplicationRecord
  belongs_to :prsenter, required: false
  belongs_to :user, required: false
end
