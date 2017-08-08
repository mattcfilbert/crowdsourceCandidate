class Candidate < ApplicationRecord
  has_many :votes, dependent: :destroy
  belongs_to :district
  belongs_to :user
  validates :name, :party, presence: true
  validates :about, length: { maximum: 500 }
end
