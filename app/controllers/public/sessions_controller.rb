# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController
   #before_action :configure_sign_in_params, only: [:create]
before_action :configure_permitted_parameters, if: :devise_controller?
before_action :reject_customer, only: [:create]
  # GET /resource/sign_in
  # def new
  #   super
  # end
  def after_sign_in_path_for(resource)
    customers_my_page_path
  end

  def after_sign_out_path_for(resource)
    about_path
  end
  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

   #protected

  # If you have extra params to permit, append them to the sanitizer.
   #def configure_sign_in_params
    #devise_parameter_sanitizer.permit(:sign_in, keys: [:email])
   #end
   protected
   def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_in, keys: [:email])
   end

   def reject_customer
     #ログイン時に入力されたemailに対応するユーザーがいるか探す
     @customer = Customer.find_by(email: params[:customer][:email])
     if @customer
       #入力されたパスワードが正しいか確認
       if @customer.valid_password?(params[:customer][:password]) && (@customer.is_active == false)
         flash[:notice] = "退会済みです。再度ご登録をしてご利用ください"
         redirect_to new_customer_registration_path
       else
         flash[:notice] = "項目を入力してください"
       end
     else
       flash[:notice] = "該当するユーザーが見つかりません"
     end
   end
end
