class Question < ApplicationRecord
  validates :question, :category, presence: true
  validates :category, uniqueness: true
end
