class CreateProfiles < ActiveRecord::Migration[6.0]
  def change
    create_table :profiles do |t|
      t.string :producer_comment
      t.references :producer, foreign_key: true
      t.timestamps
    end
  end
end
