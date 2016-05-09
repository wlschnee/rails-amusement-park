class UsersController < ApplicationController
  before_action :select_user, only: [:authenticate, :show]

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    redirect_to @user
  end

  def signin
  end

  def authenticate
    redirect_to @user
  end

  def show
  end

  private

  def select_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :height, :happiness, :nausea, :tickets, :admin)
  end
end
