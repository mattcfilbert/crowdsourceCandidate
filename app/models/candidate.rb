class Candidate < ApplicationRecord
  has_many :votes
  validates :name, :party, presence: true
  validates :about, length: {maximum: 500}
end
