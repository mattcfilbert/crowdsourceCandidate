class District < ApplicationRecord
  has_many :candidates, dependent: :destroy
  has_many :distZips, dependent: :destroy
  has_many :zipcodes, through: :distZips
  validates :name, presence: true
end
