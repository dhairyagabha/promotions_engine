class CreateConditions < ActiveRecord::Migration[7.2]
  def change
    create_table :conditions do |t|
      t.references :promotion, null: false, foreign_key: true
      t.string :by,            null: false
      
      t.timestamps
    end
  end
end
