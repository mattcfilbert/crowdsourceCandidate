class Hcandidate < ApplicationRecord
  has_many :hvotes, dependent: :destroy
  belongs_to :house
  belongs_to :user
  validates :name, :party, presence: true, length: { maximum: 75 }
  validates :about, length: { maximum: 500 }
end
