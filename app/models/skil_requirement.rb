class SkilRequirement < ApplicationRecord
  belongs_to :position

  validates :weight, :minimum_score, :skill_name, presence: true
  validates :minimum_score, default: 0
  validates :weight, default: 1
end
