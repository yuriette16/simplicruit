class SkillRequirement < ApplicationRecord
  belongs_to :position
  belongs_to :category
  validates :skill_name, presence: true, uniqueness: true
  validates :weight, inclusion: { in: [0, 1, 3, 5], allow_blank: true, message: "Not an allowable number." }
end
