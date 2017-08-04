class ChangeVoteCountForCandidates < ActiveRecord::Migration[5.1]
  def change
    change_column :candidates, :vote_count, :integer, default: 0
  end
end
