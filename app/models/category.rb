class Category < ApplicationRecord
  has_many :questions
  has_many :skill_requirements
  has_many :questionnaires

  validates :name, presence: true, uniqueness: true
end
