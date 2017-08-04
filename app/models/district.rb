class District < ApplicationRecord
  has_many :candidates, dependent: :destroy
  validates :number, presence: true
end
