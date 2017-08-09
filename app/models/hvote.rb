class Hvote < ApplicationRecord
  belongs_to :Hcandidate
  validates :reason, length: { minimum: 10, maximum: 250 }
end
