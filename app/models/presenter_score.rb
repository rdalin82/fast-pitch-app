class PresenterScore < ApplicationRecord
  belongs_to :question, required: false
end
