class CreateOperations < ActiveRecord::Migration[7.2]
  def change
    create_table :operations do |t|
      t.references :group, null: false, foreign_key: true
      t.string :variable_key
      t.string :operator
      t.string :constant

      t.timestamps
    end
  end
end
