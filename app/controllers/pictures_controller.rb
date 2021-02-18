class PicturesController < ApplicationController
  before_action :set_picture,only:[:show,:edit,:update,:destroy]
  def index
    @pictures = Picture.all.order(created_at: :desc)
  end

  def new
    @picture = current_user.pictures.new
  end

  def create
    @picture = current_user.pictures.new(picture_params)
    if params[:back]
      @file_name = @picture.image.filename
      render :new
    else
      if @picture.save
        ConfirmMailer.confirm_mail(@picture).deliver
        redirect_to pictures_path, notice:"投稿しました"
      else
        render :new
      end
    end
  end

  def show
    current_user
    @favorite = current_user.favorites.find_by(picture_id: params[:id])
    @count_favorites = Favorite.where(picture_id: params[:id]).count
  end

  def edit
    redirect_to users_path if current_user.id != @picture.user.id
  end

  def update
    redirect_to users_path if current_user.id != @picture.user.id
    if @picture.update(picture_params)
      redirect_to picture_path(@picture.id), notice:"投稿を更新しました"
    else
      render :edit
    end
  end

  def destroy
    redirect_to users_path if current_user.id != @picture.user.id
    if @picture.destroy
      redirect_to pictures_path, notice:"投稿を削除しました"
    else
      render :show
    end
  end

  def confirm
    @picture = current_user.pictures.new(picture_params)
    @file_name = @picture.image.filename
    render :new if @picture.invalid?
  end

  private
  def picture_params
    params.require(:picture).permit(:content,:image,:image_cache)
  end

  def set_picture
    @picture = Picture.find(params[:id])
  end
end
