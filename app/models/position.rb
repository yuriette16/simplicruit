class Position < ApplicationRecord
  has_many :skill_requirements, dependent: :destroy

  validates :title, :due_date, presence: true
end
