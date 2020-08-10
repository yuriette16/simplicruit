class Question < ApplicationRecord
  has_many :questionnaires
  belongs_to :category

  validates :question, presence: true
end
