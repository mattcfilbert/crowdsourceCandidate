class Svote < ApplicationRecord
  belongs_to :Scandidate
  validates :reason, length: { minimum: 10, maximum: 250 }
end
