class House < ApplicationRecord
  has_many :hcandidates, dependent: :destroy
  has_many :zipcodes
  validates :name, presence: true
end
