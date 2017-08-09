class Senate < ApplicationRecord
  has_many :scandidates, dependent: :destroy
  has_many :zipcodes
  validates :name, presence: true
end
