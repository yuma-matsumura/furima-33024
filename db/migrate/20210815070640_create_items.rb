class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.references :user, foreign_key: true
      t.string :product_name, null: false
      t.text :text, null: false
      t.integer :category_id, null: false
      t.integer :product_condition_id, null: false
      t.integer :shipping_charge_id, null: false
      t.integer :shipping_area_id, null: false
      t.integer :delivery_time_id, null: false
      t.integer :price, null: false
      t.timestamps
    end
  end
end
