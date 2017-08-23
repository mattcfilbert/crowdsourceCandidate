class District < ApplicationRecord
  has_many :candidates, dependent: :destroy
  has_many :distzips, dependent: :destroy
  # Can a ZIP code be in multiple districts? If not, then no
  # many-to-many needed. Otherwise, all good.
  has_many :zipcodes, through: :distzips
  validates :name, presence: true
  # Nice use of AR validations
end
