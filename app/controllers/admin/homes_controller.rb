class Admin::HomesController < ApplicationController
  before_action :authenticate_admin!
  def top
  @orders = Order.all
  @customers = Customers.all.page(params[:page]).per(5)
  end
end
