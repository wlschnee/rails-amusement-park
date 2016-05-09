class UsersController < ApplicationController
  before_action :select_user, only: [:authenticate, :show]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.save
    user_reg
  end

  def show
  end

  private
  def user_reg
    if @user
      session[:user_id] = @user.id
      redirect_to @user
    end
  end

  def select_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :height, :happiness, :nausea, :tickets, :admin)
  end
end
