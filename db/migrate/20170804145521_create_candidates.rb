class CreateCandidates < ActiveRecord::Migration[5.1]
  def change
    create_table :candidates do |t|
      t.string :name
      t.string :party
      t.string :img_url
      t.text :about
      t.integer :vote_count
      t.references :district, index: true, foreign_key: true
      t.timestamps
    end
  end
end
