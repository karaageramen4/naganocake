class CartItem < ApplicationRecord

  belongs_to :customer
  belongs_to :product

  validates :quantity ,presence:true

  def add_tax
    (self.product.price_without_tax * 1.10).round
  end

  def calc_subtotal
    (self.product.price_without_tax * 1.10 * self.quantity).round
  end

end