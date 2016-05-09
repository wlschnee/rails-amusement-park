class RidesController < ApplicationController
  def create
    @ride = Ride.new(params.require(:ride).permit(:user_id, :attraction_id))
    if @ride.save
      message = @ride.take_ride
      redirect_to user_path(@ride.user), notice: message
    end
  end

end
