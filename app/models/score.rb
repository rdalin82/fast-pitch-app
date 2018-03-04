class Score < ApplicationRecord
  belongs_to :Questions, required: false
  belongs_to :presenters, required: false
  belongs_to :users, required: false
end
