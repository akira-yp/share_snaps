class PicturesController < ApplicationController
  def index
    @pictures = Picture.all
  end
  def new
    @picture = Picture.new
  end
  def create
    @picture = Picture.new(pictue_params)
    if @picture.save
      redirect_to pictures_path, notice:"投稿しました"
    else
      render :new
    end
  end
  private
  def picture_params
    params.require(:picture).permit(:content,:image,:image_cache)
  end
end
