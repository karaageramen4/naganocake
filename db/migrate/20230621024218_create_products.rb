class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|

     t.integer :genre_id
     t.string :name
     t.integer :price
     t.boolean :is_sold
     t.text :introduction
      t.timestamps
    end
  end
end
