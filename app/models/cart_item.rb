class CartItem < ApplicationRecord

  belongs_to :customer
  belongs_to :product

  validates :quantity ,presence:true

  def add_tax
    (self.product.price_without_tax * 1.10).round
  end

  def subtotal
    product.with_tax_price * quantity
  end

end