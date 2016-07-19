require "./lib/player"
require "./lib/board"
require "./lib/communication"

class Ship
  attr_reader :destroyer, :battleship

  def initialize
    @destroyer_coordinates = []
    # @board = Board.new
    @destroyer = "destroyer"
    @battleship = "battleship"
    @communication = Communication.new
    @horizontal = false
    @vertical = false
  end

  def destroyer_size
    2
  end

  def battleship_size
    3
  end

end
