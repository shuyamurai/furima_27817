class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.text :image, null: false
      t.string :name, null: false
      t.text :description, null: false
      t.integer :category_id, null: false
      t.integer :condition_id, null: false
      t.integer :delivery_fee_payers_id, null: false
      t.integer :shipping_origin_id, null: false
      t.integer :days_until_shipping_id, null: false
      t.integer :price, null: false
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end