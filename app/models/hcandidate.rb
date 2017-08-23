class Hcandidate < ApplicationRecord
  has_many :hvotes, dependent: :destroy
  belongs_to :house
  # Again, think about whether or not this is duplicating some of
  # what `Candidate` is and how you might unify these entities into
  # one.
  belongs_to :user
  validates :name, :party, presence: true, length: { maximum: 75 }
  validates :about, length: { maximum: 500 }
end
