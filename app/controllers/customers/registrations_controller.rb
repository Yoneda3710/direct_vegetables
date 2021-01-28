# frozen_string_literal: true

class Customers::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

  def new
    @customer = Customer.new
  end

  def create
    @customer = Customer.new(sign_up_params)
      unless @customer.valid?
        render :new and return
      end
    session["devise.regist_data"] = {customer: @customer.attributes}
    session["devise.regist_data"][:customer]["password"] = params[:customer][:password]
    @address = @customer.build_address
    render :new_address
  end

  def create_address
    @customer = Customer.new(session["devise.regist_data"]["customer"])
    @address = Address.new(address_params)
      unless @address.valid?
        render :new_address and return
      end 
    @customer.build_address(@address.attributes)
    @customer.save
    session["devise.regist_data"]["customer"].clear
    sign_in(:customer, @customer)
  end

  private

  def address_params
    params.require(:address).permit(:postal_code, :prefecture, :city, :house_number, :building_name)
  end

  # GET /resource/sign_up
  # def new
  #   super
  # end

  # POST /resource
  # def create
  #   super
  # end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end