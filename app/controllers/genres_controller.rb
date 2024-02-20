class GenresController < ApplicationController
  def show
    @genres = Genre.all
    @genre = Genre.find(params[:id])
    @items = Item.where(genre_id: @genre.id).page(params[:page]).per(6)
  end
end
