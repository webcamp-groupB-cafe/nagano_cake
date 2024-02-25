class Admin::OrderDetailsController < ApplicationController
    before_action :authenticate_admin!

def update
    @order_detail = OrderDetail.find(params[:id])
    @order = @order_detail.order
    @order_details = @order.order_details.all
   #@order_detail.update(order_detail_params)

   is_updated = true
    if @order_detail.update(order_detail_params)
       @order.update(status: "making") if @order_detail.making_status == "manufacturing"
       @order_details.each do |order_detail|
          if order_detail.making_status != "finish"
            is_updated = false
          end
       end
       @order.update(status: "preparing_ship") if is_updated
    end
       redirect_to admin_order_path(@order)
end

private

  def order_detail_params
    params.require(:order_detail).permit(:making_status)
  end

end
