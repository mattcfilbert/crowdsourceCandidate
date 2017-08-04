class Candidate < ApplicationRecord
  has_many :votes, dependent: :destroy
  belongs_to :district
  validates :name, :party, presence: true
  validates :about, length: {maximum: 500}
end
