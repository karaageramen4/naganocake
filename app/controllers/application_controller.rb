class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?



  # #customer

  #   def after_sign_in_path_for(resource)
  #     root_path
  #   end

  #   def after_sign_up_path_for(resource)
  #     customers_my_page_path
  #   end

  #   def after_sign_out_path_for(resource)
  #     root_path
  #   end



  # #admin

  #   def after_sign_in_path_for(resource)
  #     admin_path
  #   end

  #   def after_sign_out_path_for(resource)
  #     new_admin_session_path
  #   end



 protected

  def configure_permitted_parameters
    # binding.pry
    devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name, :first_name, :last_name_kana, :first_name_kana, :email, :postal_code, :address, :telephone_number])

    devise_parameter_sanitizer.permit(:sign_in, keys: [:email])
  end



end
