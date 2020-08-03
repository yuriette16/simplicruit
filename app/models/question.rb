class Question < ApplicationRecord
  has_many :questionnaires

  validates :question, :category, presence: true
  validates :category, uniqueness: true
end
