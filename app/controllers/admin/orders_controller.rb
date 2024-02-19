class Admin::OrdersController < ApplicationController
  def show
      @order = Order.order
  if @order.nil?
render json: { error: "指定された注文が見つかりません" }, status: :not_found
  end
  end


end
