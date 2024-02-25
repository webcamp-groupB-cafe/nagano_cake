class HomesController < ApplicationController
  def top
    #商品を新着順に４件表示する
    @items = Item.order(created_at: :desc).limit(4)
    @genres = Genre.all
  end

  def about
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :price)
  end
end
