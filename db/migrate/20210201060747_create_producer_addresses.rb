class CreateProducerAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :producer_addresses do |t|
      t.string  :postal_code
      t.integer :prefecture
      t.string  :city
      t.string  :house_number
      t.string :building_name
      t.references :producer
      t.timestamps
    end
  end
end
