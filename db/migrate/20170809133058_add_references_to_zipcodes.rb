class AddReferencesToZipcodes < ActiveRecord::Migration[5.1]
  def change
    add_reference :zipcodes, :house, index: true, foreign_key: true
    add_reference :zipcodes, :senate, index: true, foreign_key: true
  end
end
