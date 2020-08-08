class JobApplication < ApplicationRecord
  belongs_to :position
  has_many :questionnaires, dependent: :destroy
  has_many :questions, through: :questionnaires
  has_one_attached :resume
  has_one_attached :video
  validates :candidate_name, :email, presence: true

  # after_update :async_update # Run on create & update

  # private

  # def async_update
  #   # AnalysisVideoJob.perform_later(self.id)
  # end

end
