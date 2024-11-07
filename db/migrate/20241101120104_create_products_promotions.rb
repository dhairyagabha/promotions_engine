class CreateProductsPromotions < ActiveRecord::Migration[7.2]
  def change
    create_table :products_promotions do |t|
      t.references :product,    null: false, foreign_key: true
      t.references :promotion,  null: false, foreign_key: true
      t.string :relationship,   null: false

      t.timestamps
    end

    add_index :products_promotions, [:product_id, :promotion_id], unique: true
  end
end
