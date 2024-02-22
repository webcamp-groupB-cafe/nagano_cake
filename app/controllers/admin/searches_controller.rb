class Admin::SearchesController < ApplicationController
  before_action :authenticate_admin!
  def search
    @word = params[:word]
    @search = params[:search]
    @range = params[:range]


    if @range == "商品"
      @items = Item.looks(@search, @word).page(params[:page]).per(6)
      @genres = Genre.all
    end
  end
end
