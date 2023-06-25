class Admin::OrdersController < ApplicationController

  def update
    order_product = OrderDetail.find(params[:id])
    order_product.update(order_product_params)
    redirect_to admin_order_path(order_product.id)
  end

  private

    def order_product_params
      params.require(:order_product).permit(:order_id, :product_id, :price, :quantity, :produciton_status)
    end
end