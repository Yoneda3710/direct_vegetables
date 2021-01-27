class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string  :postal_code
      t.integer :prefecture
      t.string  :city
      t.string  :house_number
      t.string :building_name
      t.references :customer
      t.references :producer
      t.timestamps
    end
  end
end
