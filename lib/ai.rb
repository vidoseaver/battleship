require './lib/board'
require './lib/ships'
require './lib/validator'

class Ai
  attr_accessor :ship_board, :shots_board

  def initialize
    @ship_board = Board.new
    @shots_board = Board.new
  end


  def it_gives_a_random_coordinate
    @ship_board.empty_board.values.sample
  end

  def two_random_coordinates
    @random_coordinates = []
    @random_coordinates << @ship_board.empty_board.values.sample
    @random_coordinates << @ship_board.empty_board.values.sample
    @random_coordinates.join
  end




end
