
class Admin::ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update]

  def new
    @product = Product.new
    @genres = Genre.all
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to admin_product_path(@product)
    else
      @genres = Genre.all
      render :new
    end
  end

  def index
    @products = Product.page(params[:page])
  end

  def show
  end

  def edit
    @genres = Genre.all
  end

  def update
    if @product.update(product_params)
      redirect_to admin_product_path(@product)
    else
      @genres = Genre.all
      render :edit
    end
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:genre_id, :name, :introduction, :price, :is_active, :image)
  end
end
