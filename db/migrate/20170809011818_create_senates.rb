class CreateSenates < ActiveRecord::Migration[5.1]
  def change
    create_table :senates do |t|
      t.string :name
      t.string :img_url
    end
  end
end
