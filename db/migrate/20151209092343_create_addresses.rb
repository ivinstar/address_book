class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :country
      t.string :city
      t.string :street_name
      t.integer :house
      t.string :zipcode
      t.string :street_type

      t.timestamps
    end
  end
end
