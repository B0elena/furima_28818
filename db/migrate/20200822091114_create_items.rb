class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :image
      t.string :product
      t.text :description
      t.integer :category_id
      t.integer :condition_id
      t.integer :shipping_cost_id
      t.integer :shipping_origin_id
      t.integer :shipping_day_id
      t.integer :price
      t.references :user
      t.timestamps
    end
  end
end
