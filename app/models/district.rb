class District < ApplicationRecord
  has_many :candidates, dependent: :destroy
  validates :name, presence: true
end
