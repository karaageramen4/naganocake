class Public::ItemsController < ApplicationController

  def index
    # @genres = Genre.all
    @all_product = Product.all
    @products = Product.page(params[:page]).per(8)
  end


  def show
    # @genres = Genre.all
    @product = Product.find(params[:id])
    @cart_item = CartItem.new
    @customer = current_customer


  end

end
