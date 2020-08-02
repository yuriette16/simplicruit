class JobApplication < ApplicationRecord
  belongs_to :position
  has_many :questionnaires, dependent: :destroy

  has_one_attached :resume, :video

  validates :candidate_name, :email, :interview_date, presence: true
end
