class Admin::OrdersController < ApplicationController

  def show
    @order = Order.find(params[:id])
    @order_products = @order.order_products
  end

  def update
    order = Order.find(params[:id])
    order.update(order_params)
    if order.order_status == "入金確認"
      order.order_products.update_all(produciton_status: 1)
    end
    redirect_to admin_order_path(order.id)
    
    
  end

  private

  def order_params
    params.require(:order).permit(:order_status)
  end


end