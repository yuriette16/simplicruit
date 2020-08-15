class Position < ApplicationRecord
  has_many :skill_requirements
  has_many :job_applications, dependent: :destroy
  validates :title, :due_date, presence: true
end
