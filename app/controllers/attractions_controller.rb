class AttractionsController < ApplicationController
  before_action :set_attraction, only: [:show, :edit]

  def index
    @attractions = Attraction.all
    @user = User.find(session[:user_id])
  end

  def show
    @ride = Ride.new
  end

  def new
    @attraction = Attraction.new
  end

  def create
    @attraction = Attraction.create(params.require(:attraction).permit(:name, :min_height, :happiness_rating, :nausea_rating, :tickets))
    redirect_to attraction_path(@attraction)
  end

  def edit
    @attraction = Attraction.find(params[:id])
  end

  def update
    # binding.pry
    @user = User.find(session[:user_id])
    @attraction = Attraction.find(params[:id])
    @attraction.update(params.require(:attraction).permit(:name, :min_height, :happiness_rating, :nausea_rating, :tickets)) if @user.admin
    redirect_to attraction_path(@attraction)
  end

  private

  def set_attraction
    @attraction = Attraction.find(params[:id])
  end
end
