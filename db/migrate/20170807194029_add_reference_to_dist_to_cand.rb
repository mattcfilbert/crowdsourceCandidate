class AddReferenceToDistToCand < ActiveRecord::Migration[5.1]
  def change
    add_reference :candidates, :district, index: true, foreign_key: true
  end
end
