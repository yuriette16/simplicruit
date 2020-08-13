class SkillRequirement < ApplicationRecord
  WEIGHT = ["unnecessary", "low", "medium", "high"]
  belongs_to :position
  belongs_to :category

  enum weight: { unnecessary: 0, low: 1, medium: 3, high: 5 }
end
