class Admin::OrdersController < ApplicationController
  before_action :authenticate_admin!
  def show
    @order_details = OrderDetail.where(order_id: params[:id])
   @order = Order.find(params[:id])
  end

def index

   if params[:id]
     @customer = Customer.find(params[:id])
     @orders = @customer.orders.page(params[:page]).per(6)
   else
     @orders = Order.all
   end
end

def update
    @order = Order.find(params[:id])
    @order_details = @order.order_details
    if @order.update(order_params)
       @order_details.update_all(making_status: "waiting_manufacture") if @order.status == "confirm_payment"
    end
      redirect_to admin_order_path(@order)
  end

private

def order_params
  params.require(:order).permit(:status)
end


end
