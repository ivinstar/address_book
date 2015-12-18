class AddIndexToAddresses < ActiveRecord::Migration
  def change
    add_index(:addresses, [:street_name, :street_type])
    add_index(:addresses, :zipcode)
  end
end
