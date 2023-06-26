class Public::OrdersController < ApplicationController
  before_action :authenticate_customer!

  def new
    @order = current_customer.orders.new
  end



  def create
    @order = current_customer.orders.new(order_params)

    if @order.save
      cart_items = current_customer.cart_items
      cart_items.each do |cart_item|
        order_product = OrderProduct.new
        order_product.order_id = @order.id
        order_product.product_id = cart_item.product_id
        order_product.quantity = cart_item.quantity
        order_product.price = cart_item.product.with_tax_price
        order_product.produciton_status = 0
        order_product.save
      end
      cart_items.destroy_all
    redirect_to public_thanks_path
    else
      render :new
    end
  end


  def confirm
    @orders = current_customer.orders
    @order = Order.new(order_params)

  if params[:order][:select_address] == "0"
    @order.postal_code = current_customer.postal_code
    @order.address = current_customer.address
    @order.name = current_customer.last_name + current_customer.first_name

  elsif params[:order][:select_address] == "1"
    @address = Address.find(params[:order][:address_id])
    @order.postal_code = @address.postal_code
    @order.address = @address.address
    @order.name = @address.name

  else

    @order.postal_code = params[:order][:postal_code]
    @order.address = params[:order][:address]
    @order.name = params[:order][:name]

  end
     @total = 0
     @cart_items = current_customer.cart_items.all
  end

  def index
    @orders = current_customer.orders
  end

  def show
    @order = Order.find(params[:id])
    @order_products = @order.order_products
    @toral = 0

  end

private

  def order_params
    params.require(:order).permit(:customer_id, :postal_code, :address, :name, :postage, :billing_total, :payment_method, :order_status)
  end

end