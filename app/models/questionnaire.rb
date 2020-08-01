class Questionnaire < ApplicationRecord
  belongs_to :question
  belongs_to :job_application

  validates :answer, presence: true
end
