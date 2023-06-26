class AddIndexAndDefaultToProduct < ActiveRecord::Migration[6.1]
  def change
    # idカラムにインデックスを追加
    add_index :products, :id

    # is_soldカラムにデフォルト値としてTRUEを設定
    change_column_default :products, :is_sold, true
  end
end
