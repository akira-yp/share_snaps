class UsersController < ApplicationController
  before_action :set_user,only:[:show,:edit,:update,:destroy]
  def index
    @users = User.all
  end
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to new_session_path, notice:"アカウントを作成しました"
    else
      render :new
    end
  end

  def show
    current_user
    @pictures = @user.pictures.all.order(created_at: :desc)
  end

  def edit
    redirect_to users_path if current_user.id != @user.id
  end

  def update
    current_user
    if @current_user.id == @user.id
      if @user.update(user_params)
        redirect_to user_path(@user.id), notice:"ユーザー情報を変更しました"
      else
        render :edit
      end
    else
      redirect_to users_path
    end
  end
   private
   def user_params
     params.require(:user).permit(:name, :email, :password,:password_confirmation,:avatar,:avatar_cache,:greeting )
   end

   def set_user
     @user = User.find(params[:id])
   end
end
