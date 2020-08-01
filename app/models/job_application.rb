class JobApplication < ApplicationRecord
  belongs_to :position
  has_one_attached :resume, :video

  validates :candidate_name, :email, :apply_date, :resume, :video, :status, presence: true
end
