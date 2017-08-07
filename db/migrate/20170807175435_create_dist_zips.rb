class CreateDistZips < ActiveRecord::Migration[5.1]
  def change
    create_table :dist_zips do |t|
      t.references :district, index: true, foreign_key: true, null: false
      t.references :zipcode, index: true, foreign_key: true, null: false
    end
  end
end
