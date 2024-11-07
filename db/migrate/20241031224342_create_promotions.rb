class CreatePromotions < ActiveRecord::Migration[7.2]
  def change
    create_table :promotions do |t|
      t.references :property,       null: false, foreign_key: true
      t.string :name,               null: false
      t.string :description,        null: false
      t.string :short_description,  null: false
      t.string :code,               null: false
      t.date :start
      t.date :end
      t.string :link,               null: false
      t.integer :rank,              null: false, default: 1
      t.integer :status,            null: false, default: 0

      t.timestamps
    end
    add_index :promotions, [:property_id, :code], unique: true
  end
end
