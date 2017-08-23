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
    # I'm not sure you entirely need a new table for candidates running
    # for house positions explicitly. You should be able to just use the
    # candidates tables and make associations between candidates and houses.
    # You may need to use `belongs_to :house, optional: true` on the related
    # model though.
  end
end
