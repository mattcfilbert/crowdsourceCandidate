class AddColumnsToZips < ActiveRecord::Migration[5.1]
  def change
    add_column :zipcodes, :school_district, :string
    add_column :zipcodes, :county, :string
    add_column :zipcodes, :city, :string
  end
end
