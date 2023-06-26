class AddIndexToGenre < ActiveRecord::Migration[6.1]
  def change
    # idカラムにインデックスを追加
    add_index :genres, :id
  end
end
