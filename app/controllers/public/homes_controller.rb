class Public::HomesController < ApplicationController
  def top
    @products = Product.limit(4)
  end

  def about
  end
end
