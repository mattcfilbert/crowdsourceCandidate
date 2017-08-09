class Senate < ApplicationRecord
  has_many :Scandidates, dependent: :destroy
  has_many :zipcodes
  validates :name, presence: true
end
