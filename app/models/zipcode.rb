class Zipcode < ApplicationRecord
  has_many :distZips, dependent: :destroy
  has_many :districts, through: :distZips
  validates :zip, presence: true
end
