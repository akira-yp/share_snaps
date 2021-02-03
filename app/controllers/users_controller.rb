class UsersController < ApplicationController
  before_action :set_user,only:[:show,:edit,:update,:destroy]
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to user_path(@user.id),notice:"アカウントを作成しました"
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to user_path(@user.id), notice:"ユーザー情報を変更しました"
    else
      render :edit
    end
  end
   private
   def user_params
     params.require(:user).permit(:name, :email, :password,:password_confirmation,:avatar,:avatar_cache )
   end

   def set_user
     @user = User.find(params[:id])
   end
end
