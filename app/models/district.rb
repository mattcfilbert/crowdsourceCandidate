class District < ApplicationRecord
  has_many :candidates
  validates :number, presence: true
end
