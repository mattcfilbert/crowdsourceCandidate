class District < ApplicationRecord
  has_many :candidates, dependent: :destroy
  has_many :distzips, dependent: :destroy
  has_many :zipcodes, through: :distzips
  validates :name, presence: true
end
