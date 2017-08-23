require_relative '20170804150606_create_districts.rb'

class CreateCandidates < ActiveRecord::Migration[5.1]
  def change
    create_table :candidates do |t|
      t.string :name
      t.string :party
      # While this is completely acceptable for the current functionality
      # of the app, consider whether or not `party` is its own entity with
      # relationships with `candidate` instead of just a string attribute
      # on `candidate`
      t.string :img_url
      t.string :slogan
      t.text :about
      t.integer :vote_count
      t.timestamps
    end
  end
end
