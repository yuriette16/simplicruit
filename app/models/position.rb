class Position < ApplicationRecord
  validates :title, :due_date, presence: true
end
