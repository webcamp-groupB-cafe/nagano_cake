class HomesController < ApplicationController
  def top
    #商品を新着順に４件表示する
    @items = Item.order(created_at: :desc).limit(4)
  end

  def about
  end
end
