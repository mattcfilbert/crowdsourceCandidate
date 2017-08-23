class House < ApplicationRecord
  has_many :hcandidates, dependent: :destroy
  has_many :zipcodes
  validates :name, presence: true
  # Also, think about whether `House` and `Senate` are two types of
  # the **same** entity (something like `Legislature`)
end
