class CreateProperties < ActiveRecord::Migration[7.2]
  def change
    create_table :properties do |t|
      t.string :name,     null: false
      t.string :api_key,  null: false
      t.string :secret,   null: false

      t.timestamps
    end
    add_index :properties, :api_key, unique: true
    add_index :properties, :secret, unique: true
  end
end
