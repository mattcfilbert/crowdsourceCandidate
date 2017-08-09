class CreateHvotes < ActiveRecord::Migration[5.1]
  def change
    create_table :hvotes do |t|
      t.text :reason
      t.references :hcandidate, index: true, foreign_key: true
      t.timestamps
    end
  end
end