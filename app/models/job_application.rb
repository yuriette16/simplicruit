class JobApplication < ApplicationRecord
  belongs_to :position
  has_many :questionnaires, dependent: :destroy

  has_one_attached :resume
  has_one_attached :video
  validates :candidate_name, :email, presence: true
end
