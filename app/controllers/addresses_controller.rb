class AddressesController < ApplicationController
  def index
    @address = Address.new
  end

  def create
    @address = Address.new(adress_params)
 　
    if @address.save
      redirect_to edit_address_path(@address)
    else
      render :index
    end
  end

  def edit

  end

  def update
  @address = Address.find(params[:id])
  if @address.update(address_params)
    redirect_to addresses_path
  else
    render 'edit'
  end
end

  private

def adress_params
  params.require(:address).permit(:postal_code, :adress, :name)
end
end
