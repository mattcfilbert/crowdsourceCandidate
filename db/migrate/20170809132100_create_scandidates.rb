class CreateScandidates < ActiveRecord::Migration[5.1]
  def change
    create_table :scandidates do |t|
      t.string :name
      t.string :party
      t.string :img_url
      t.string :slogan
      t.text :about
      t.integer :vote_count
      t.references :senate, index: true, foreign_key: true
      t.timestamps
    end
  end
end
