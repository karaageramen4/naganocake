class Admin::OrderDetailsController < ApplicationController

  def update
    @order_product = OrderProduct.find(params[:id])
    @order_product.update(order_product_params)
    @order = @order_product.order
    if @order.order_products.where(produciton_status: 2).count >= 1
      @order.order_status = 2
      @order.save
    end

    if @order.order_products.where(produciton_status: 3).count == @order.order_products.count
      @order.order_status = 3
      @order.save
    end

    redirect_to request.referrer

  end

  private

    def order_product_params
      params.require(:order_product).permit(:order_id, :product_id, :price, :quantity, :produciton_status)
    end
end