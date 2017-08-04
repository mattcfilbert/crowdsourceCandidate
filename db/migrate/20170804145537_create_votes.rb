class CreateVotes < ActiveRecord::Migration[5.1]
  def change
    create_table :votes do |t|
      t.text :reason
      t.references :candidate, index: true, foreign_key: true
      t.timestamps
    end
  end
end
