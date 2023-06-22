class Public::OrdersController < ApplicationController
  def new
  end

  def thanks
  end

  def index
    @orders = current_customer.orders
  end

  def show
  end
end
