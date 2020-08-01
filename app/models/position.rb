class Position < ApplicationRecord
  belongs_to :email_template
  belongs_to :email_template
  belongs_to :email_template

  validates :title, :due_date, :passing_score, :resume_score_ratio, presence: true
end
