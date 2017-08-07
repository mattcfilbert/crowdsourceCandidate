class Zipcode < ApplicationRecord
  has_many :distzips, dependent: :destroy
  has_many :districts, through: :distzips
  validates :zip, presence: true
end
