class Svote < ApplicationRecord
  belongs_to :scandidate
  validates :reason, length: { minimum: 10, maximum: 250 }
end
