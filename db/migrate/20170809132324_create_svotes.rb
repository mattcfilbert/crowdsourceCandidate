class CreateSvotes < ActiveRecord::Migration[5.1]
  def change
    create_table :svotes do |t|
      t.text :reason
      t.references :scandidate, index: true, foreign_key: true
      t.timestamps
    end
    # The same could apply here. One table (votes) with associations
    # to a `candidate` AND and `house` or `senate` (optional: true)
  end
end
