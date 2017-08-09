class CreateZipcodes < ActiveRecord::Migration[5.1]
  def change
    create_table :zipcodes do |t|
      t.integer :zip
    end
  end
end
