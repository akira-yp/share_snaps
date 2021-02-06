class FavoritesController < ApplicationController
  def create
    current_user.favorites.create(picture_id: params[:picture_id])
  end

  def destroy
    current_user.favorites.find_by(picture_id: params[:id]).destroy
  end
end
