class Hvote < ApplicationRecord
  belongs_to :hcandidate
  validates :reason, length: { minimum: 10, maximum: 250 }
end
