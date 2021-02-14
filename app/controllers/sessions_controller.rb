class SessionsController < ApplicationController
  def new
  end
  def create
    user = User.find_by(params[:session][:email].downcase!)
    if user && user.authenticate(params[:session][:password])
      session[:user_id]= user.id
      redirect_to users_path,notice:"ログインしました"
    else
      flash.now[:notice] = "ログインに失敗しました"
      render :new
    end
  end
  def destroy
    session.delete(:user_id)
    flash[:notice] = "ログアウトしました"
    redirect_to new_session_path
  end
end
