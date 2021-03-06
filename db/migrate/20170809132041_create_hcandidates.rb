class CreateHcandidates < ActiveRecord::Migration[5.1]
  def change
    create_table :hcandidates do |t|
      t.string :name
      t.string :party
      t.string :img_url
      t.string :slogan
      t.text :about
      t.integer :vote_count, default: 0
      t.references :house, index: true, foreign_key: true
      t.timestamps
    end
  end
end
