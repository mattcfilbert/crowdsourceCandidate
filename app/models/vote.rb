class Vote < ApplicationRecord
  belongs_to :candidate
  validates :reason, length: { minimum: 10, maximum: 250 }
end
