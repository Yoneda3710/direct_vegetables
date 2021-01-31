class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name,          null: false
      t.string :description,   null: false
      t.string :price,         null: false
      t.references :producer,  null: false, foreign_key: true
      t.timestamps
    end
  end
end
