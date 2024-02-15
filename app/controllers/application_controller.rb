class ApplicationController < ActionController::Base
  def after_sign_in_path_for(resource)
    customers_my_page_path
  end

  def after_sign_out_path_for(resource)
    about_path
  end
end