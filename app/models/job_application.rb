class JobApplication < ApplicationRecord
  belongs_to :position
  has_many :questionnaires, dependent: :destroy
  has_many :questions, through: :questionnaires

  has_one_attached :resume
  has_one_attached :video

  validates :candidate_name, :email, presence: true

  # after_update :async_update # Run on create & update
  enum status: { processing: 0, reserved: 1, invited: 2, on_hold: 3, pending: 4, unqualified: 5 }
  # private

  # def async_update
  #   # AnalysisVideoJob.perform_later(self.id)
  # end

end
