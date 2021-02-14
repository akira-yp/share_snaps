class FavoritesController < ApplicationController
  def index
    @favorite_pictures = current_user.favorites_pictures.all
  end
  def create
    current_user.favorites.create(picture_id: params[:picture_id])
    redirect_to picture_path(params[:picture_id])
  end

  def destroy
    picture_number = Favorite.find(params[:id]).picture_id
    @my_favorite = current_user.favorites.find_by(params[:picture_id])
    @my_favorite.destroy
    redirect_to picture_path(picture_number)
  end
end
