class House < ApplicationRecord
  has_many :Hcandidates, dependent: :destroy
  has_many :zipcodes
  validates :name, presence: true
end
