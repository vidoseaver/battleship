require "./lib/player"
require "./lib/communication"
require "./lib/board"
require "./lib/ai.rb"
require "./lib/ships"
require "pry"

class Battleship

  def initialize
    @communication = Communication.new
    @user =          Player.new
    @computer =      Player.new
    @ai =            Ai.new
    @validator =     Validator.new
    @computer_ships = Ship.new
    @computer_ship_board = Board.new
  end

  def start
    @communication.start
    @communication.start_answer_interpreter
    puts @communication.shit_talk_1
    ai_ship_placement
  end

  def ai_ship_placement
    first_ship_coordinates = @ai.two_random_coordinates
    if @validator.are_the_coordinates_valid?(first_ship_coordinates) && @validator.destroyer_congruent?(first_ship_coordinates)
      @computer_ships.destroyer_coordinates_writer(first_ship_coordinates)
      @computer_ships.coordinate_to_board_pusher(first_ship_coordinates.scan(/../),"d")
      puts @computer_ships.player_boat_board
    else
      ai_ship_placement
    end
  end

end

game = Battleship.new

game.start


#
# communication.start
# puts communication.shit_talk_1
# puts communication.ship_placement
# player.first_ship_coordinates_changer
# while board.proper_format?(player.first_ship_coordinates) == false
#   if board.proper_format?(player.first_ship_coordinates)
#     return
#   else
#     puts communication.wrong_coordinate_format
#     player.first_ship_coordinates_changer
#   end
# end
