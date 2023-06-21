class Product < ApplicationRecord
  validates :genre_id, presence: true
  validates :name, presence: true
  validates :price, presence: true
  validates :is_sold, presence: true
  validates :introduction, presence: true
  has_one_attached :image

end
