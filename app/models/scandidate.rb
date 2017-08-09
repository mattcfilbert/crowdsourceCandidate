class Scandidate < ApplicationRecord
  has_many :Svotes, dependent: :destroy
  belongs_to :senate
  belongs_to :user
  validates :name, :party, presence: true, length: { maximum: 75 }
  validates :about, length: { maximum: 500 }
end
