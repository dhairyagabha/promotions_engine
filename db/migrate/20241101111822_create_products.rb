class CreateProducts < ActiveRecord::Migration[7.2]
  def change
    create_table :products do |t|
      t.references :property, null: false, foreign_key: true
      t.string :sku,          null: false

      t.timestamps
    end
    add_index :products, [:property_id, :sku], unique: true
  end
end
