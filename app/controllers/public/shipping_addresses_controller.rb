class Public::ShippingAddressesController < ApplicationController
  # before_action :authenticate_customer!

  def index
    @address = ShippingAddress.new
    @addresses = current_customer.shipping_addresses
  end

  def create
    @address = ShippingAddress.new(address_params)
    @address.customer_id = current_customer.id
    if @address.save
      redirect_to public_shipping_addresses_path
    else
      render :index
    end
  end

  def edit
    @address = current_customer.shipping_addresses.find(params[:id])
  end

  def update
    @address = current_customer.shipping_addresses.find(params[:id])
    if @address.update(address_params)
      redirect_to public_shipping_addresses_path
    else
      render :edit
    end
  end

  def destroy
    @address = current_customer.shipping_addresses.find(params[:id])
    @address.destroy
    redirect_to public_shipping_addresses_path
  end

  private

  def address_params
    params.require(:shipping_address).permit(:customer_id, :name, :postal_code, :address)
  end
end
