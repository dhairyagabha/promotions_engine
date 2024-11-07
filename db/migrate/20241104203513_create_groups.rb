class CreateGroups < ActiveRecord::Migration[7.2]
  def change
    create_table :groups do |t|
      t.references :condition, null: false, foreign_key: true
      t.string :by,            null: false

      t.timestamps
    end
  end
end
