class Admin::OrdersController < ApplicationController
  def show
    @order_details = OrderDetail.where(order_id: params[:id])
    @order = Order.find(params[:id])
  end

def update
  @order_detail = Order.find(params[:id])
  if @order_detail.update(order_params)
    redirect_to admin_order_path
  else
    redirect_to admin_order_path
  end

end

private

def order_params
  params.require(:order).permit(:status)
end

def order_detail_params
  params.require(:order_detail).permit(:making_status)
end
end
