class Ride < ActiveRecord::Base
  belongs_to :user
  belongs_to :attraction

#   has a method 'take_ride' that accounts for the user not having enough tickets (FAILED - 1)
# has a method 'take_ride' that accounts for the user not being tall enough (FAILED - 2)
# has a method 'take_ride' that accounts for the user not being tall enough and not having enough tickets (FAILED - 3)
# has a method 'take_ride' that updates ticket number (FAILED - 4)
# has a method 'take_ride' that updates the user's nausea (FAILED - 5)
# has a method 'take_ride' that updates the user's happiness (FAILED - 6)

  def take_ride
    if user.tickets > attraction.tickets && user.height > attraction.min_height
      user.tickets -= attraction.tickets
      user.nausea += attraction.nausea_rating
      user.happiness += attraction.happiness_rating
      user.save
      "Thanks for riding the #{attraction.name}!"
    elsif !(user.tickets > attraction.tickets) && !(user.height > attraction.min_height)
      "Sorry. You do not have enough tickets the #{attraction.name}. You are not tall enough to ride the #{attraction.name}."
    elsif user.tickets > attraction.tickets && !(user.height > attraction.min_height)
      "Sorry. You are not tall enough to ride the #{attraction.name}."
    elsif !(user.tickets > attraction.tickets)
      "Sorry. You do not have enough tickets the #{attraction.name}."
    end
  end
end
