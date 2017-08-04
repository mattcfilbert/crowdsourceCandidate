class CreateDistricts < ActiveRecord::Migration[5.1]
  def change
    create_table :districts do |t|
      t.string :number
      t.string :img_url
      t.timestamps
    end
  end
end
