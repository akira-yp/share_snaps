class PicturesController < ApplicationController
  before_action :set_picture,only:[:show,:edit,:update,:destroy]
  def index
    @pictures = Picture.all
  end
  def new
    @picture = current_user.pictures.new
  end
  def create
    @picture = current_user.pictures.new(picture_params)
    if @picture.save
      redirect_to pictures_path, notice:"投稿しました"
    else
      render :new
    end
  end
  def show
  end
  def edit
  end
  def update
    if @picture.update(picture_params)
      redirect_to picture_path(@picture.id), notice:"投稿を更新しました"
    else
      render :edit
    end
  end
  def destroy
    if @picture.destroy
      recirect_to pictures_path, notice:"投稿を削除しました"
    else
      render :show
    end
  end
  private
  def picture_params
    params.require(:picture).permit(:content,:image,:image_cache)
  end
  def set_picture
    @picture = Picture.find(params[:id])
  end
end
