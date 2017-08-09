class Zipcode < ApplicationRecord
  has_many :distzips, dependent: :destroy
  has_many :districts, through: :distzips
  belongs_to :senate
  belongs_to :house
  validates :zip, presence: true
end
