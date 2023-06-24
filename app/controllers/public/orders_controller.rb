class Public::OrdersController < ApplicationController
  before_action :authenticate_customer!


  def index
    @orders = current_customer.orders
  end

  def new
    @order = Order.new
    @customer = current_customer
    @shipping_addresses = current_customer.shipping_addresses
  end

  def create
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    if @order.save!
      @cart_products = current_customer.cart_products
      @cart_products.each do |cart_product|
        order_detail = OrderDetail.new(order_id: @order.id)
        order_detail.price = cart_product.product.price
        order_detail.amount = cart_product.amount
        order_detail.product_id = cart_product.product_id
        order_detail.save!
      end
      @cart_products.destroy_all
      redirect_to orders_thanks_path
    else
      render "new"
    end
  end

  def thanks
  end


  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details.all
  end


  private

  def order_params
    params.require(:order).permit(:payment, :postcode, :city, :name, :shipping, :total_fee)
  end

  def ship_city_params
    params.require(:ship_city).permit(:customer_id, :postcode, :city, :name)
  end


end
