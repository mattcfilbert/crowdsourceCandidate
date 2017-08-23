class Svote < ApplicationRecord
  belongs_to :scandidate
  validates :reason, length: { minimum: 10, maximum: 250 }
  # A possible future feature might be to add a reference to a user
  # here so that you can track which users have voted for which
  # candidates and also limit their ability to vote more than once
end
