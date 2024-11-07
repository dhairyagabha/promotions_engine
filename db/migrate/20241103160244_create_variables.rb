class CreateVariables < ActiveRecord::Migration[7.2]
  def change
    create_table :variables do |t|
      t.references :property,     null: false, foreign_key: true
      t.string :name,             null: false
      t.string :key,              null: false
      t.string :description,      null: false
      t.integer :value_type,      null: false, default: 0
      t.string :possible_values

      t.timestamps
    end
    add_index :variables, [:property_id, :key], unique: true
  end
end
