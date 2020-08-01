class EmailTemplate < ApplicationRecord
  validates :subject, :body, :name, presence: true
end
