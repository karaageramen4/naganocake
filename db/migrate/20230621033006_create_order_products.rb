class CreateOrderProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :order_products do |t|

      t.integer :product_id
      t.integer :order_id
      t.integer :quantity
      t.integer :price
      t.integer :produciton_status, default: 0, null: false

      t.timestamps
    end
  end
end
