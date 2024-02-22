class Admin::SearchesController < ApplicationController
  before_action :authenticate_admin!
  def search
    @word = params[:word]
    @search = params[:search]
    @range = params[:range]


    if @range == "Item"
      @items = Item.looks(@search, @word)
      @genres = Genre.all
    else
      @customers = Customer.looks(@search, @word)
    end
  end
end
