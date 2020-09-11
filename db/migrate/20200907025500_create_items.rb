class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name,                   null: false
      t.text :text, :limit => 4294967295,   null: false
      t.integer :category_id,              null: false
      t.integer :status_id,                null: false
      t.integer :shopping_chipping_id,     null: false
      t.integer :area_of_delivary_id,      null: false
      t.integer :days_until_shopping_id,   null: false
      t.integer :price,                 null: false
      t.references :user,               null: false, foreign_key: true

      t.timestamps
    end
  end
end