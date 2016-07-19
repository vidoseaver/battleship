require "./lib/rules.rb"
require "./lib/player"
require "./lib/communication"
require "pry"

class Battleship

end

communication = Communication.new
player = Player.new
board = Board.new
communication.start
puts communication.shit_talk_1
puts communication.ship_placement
player.first_ship_coordinates_changer
while board.proper_format?(player.first_ship_coordinates) == false
  if board.proper_format?(player.first_ship_coordinates)
    return
  else
    puts communication.wrong_coordinate_format
    player.first_ship_coordinates_changer
  end
end
