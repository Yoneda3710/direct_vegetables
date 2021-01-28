# frozen_string_literal: true

class Producers::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

  def new
    @producer = Producer.new
  end

  def create
    @producer = Producer.new(sign_up_params)
     unless @producer.valid?
       render :new and return
     end
    session["devise.regist_data"] = {producer: @producer.attributes}
    session["devise.regist_data"][:producer]["password"] = params[:producer][:password]
    @address = @producer.build_address
    render :new_address
  end
  
  def create_address
    @producer = Producer.new(session["devise.regist_data"]["producer"])
    @address = Address.new(address_params)
     unless @address.valid?
       render :new_address and return
     end
    @producer.build_address(@address.attributes)
    @producer.save
    session["devise.regist_data"]["producer"].clear
    sign_in(:producer, @producer)
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
