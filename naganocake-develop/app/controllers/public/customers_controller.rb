class Public::CustomersController < ApplicationController
  def show


  end

  def edit
  end


  def update
    if current_customer.update(customer_params)
      redirect_to  public_my_page_path
    else
      render :edit
    end
  end

  def check
  end
  
  def withdraw
    current_.update(is_deleted: true)
    reset_session
    redirect_to root_path
  end
  
  
  private
  
  def customer_params
    params.require(:customer).permit(:email, :last_name, :first_name, :last_name_kana, :first_name_kana, :encrypted_password, :postal_code, :address, :phone_number, :is_deleted)
  end
  
end
