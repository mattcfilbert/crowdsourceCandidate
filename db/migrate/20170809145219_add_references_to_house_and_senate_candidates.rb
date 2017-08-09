class AddReferencesToHouseAndSenateCandidates < ActiveRecord::Migration[5.1]
  def change
    add_reference :hcandidates, :user, index: true, foreign_key: true
    add_reference :scandidates, :user, index: true, foreign_key: true
  end
end
