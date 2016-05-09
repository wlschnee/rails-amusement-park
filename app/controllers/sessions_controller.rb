class SessionsController < ApplicationController

  def signin
    @user = User.new
  end

  def signout
    session[:user_id] = nil
    redirect_to home_path
  end

  def authenticate
    @user = User.find(params[:user][:id])
    session[:user_id] = @user.id
    redirect_to user_path(@user)
  end

end
