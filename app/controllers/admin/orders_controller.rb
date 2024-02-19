class Admin::OrdersController < ApplicationController
  before_action :authenticate_admin!
  def show
      @order = Order.order
  if @order.nil?
render json: { error: "指定された注文が見つかりません" }, status: :not_found
  end
  end


end
