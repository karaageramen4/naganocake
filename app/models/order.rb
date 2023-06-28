class Order < ApplicationRecord

  belongs_to :customer
  has_many :order_products, dependent: :destroy

  enum payment_method: { credit_card: 0, transfer: 1 }
  enum order_status: { 入金待ち: 0, 入金確認: 1, 製作中: 2, 発送準備中: 3, 発送済み: 4}
  #enum order_status: { payment_waiting: 0, payment_confirmation: 1, in_production: 2, preparing_delivery: 3, delivered: 4}


  def subtotal
    price * amount
  end

end