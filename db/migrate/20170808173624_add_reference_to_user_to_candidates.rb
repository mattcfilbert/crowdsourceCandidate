class AddReferenceToUserToCandidates < ActiveRecord::Migration[5.1]
  def change
    add_reference :candidates, :user, index: true, foreign_key: true
  end
end
