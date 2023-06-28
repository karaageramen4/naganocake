class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|

      t.integer :customer_id
      t.integer :postage
      t.integer :payment_method, default: 0, null: false
      t.integer :billing_total
      t.integer :order_status, default: 0, null: false
      t.string :name
      t.string :postal_code
      t.string :address

      t.timestamps
    end
  end
end
