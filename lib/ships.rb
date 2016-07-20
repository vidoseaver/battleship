require "./lib/player"
require "./lib/board"
require "./lib/communication"

class Ship
  attr_reader :destroyer,
              :battleship,
              :destroyer_coordinates
              :battleship_coordinates


  def initialize
    @destroyer_coordinates = []
    @battleship_coordinates = []
    @board = Board.new
    @destroyer = "destroyer"
    @battleship = "battleship"
    @communication = Communication.new
    @horizontal = false
    @vertical = false
    @player_boat_board = Board.new
  end

  def destroyer_size
    2
  end

  def battleship_size
    3
  end

  def user_input_6?(input)
    input.chars.length == 6
  end

  def proper_format?(input)
    if user_input_6?(input) && input.chars[2]+input.chars[3] == ", "
      true
    end
  end

  def input_cleaner(input)
    cleaned_input = input[0]+input[1]+input[-2]+input[-1]
    cleaned_input
  end

  def is_the_first_valid?(input)
    input.downcase.chars
    first_point = input[0]+input[1]
    @board.empty_board.keys.any? do |key|
       key == first_point
    end
  end

  def is_the_second_valid?(input)
    input.downcase.chars
    second_point = input[2]+input[3]
    @board.empty_board.keys.any? do |key|
       key == second_point
    end
  end

  def destroyer_congruent?(input)
    @arrayed = input.chars

    if @arrayed[0] == @arrayed[2] && (@arrayed[1].to_i - @arrayed[3].to_i).abs == 1
      true
    elsif @arrayed[1] == @arrayed[3] && (@arrayed[0].ord - @arrayed[2].ord).abs == 1
      true
    else
      false
    end
  end

  def destroyer_coordinates_writer
      @destroyer_coordinates << (@arrayed[0] + @arrayed[1])
      @destroyer_coordinates << (@arrayed[2] + @arrayed[3])
      @destroyer_coordinates
  end


  def battleship_congruent?(input)
    @arrayed = input.chars

    if @arrayed[0] == @arrayed[2] && (@arrayed[1].to_i - @arrayed[3].to_i).abs == 2
      true
    elsif @arrayed[1] == @arrayed[3] && (@arrayed[0].ord - @arrayed[2].ord).abs == 2
      true
    else
      false
    end
  end

  def horizontal?(input)
    @arrayed = input.chars
    @arrayed[0] == @arrayed[2]
  end

  def vertical?(input)
    @arrayed = input.chars
    @arrayed[1] == @arrayed[3]
  end

  def synthesize_a_horizontal_ships_coordinate(input)
    @arrayed = input.chars
    char1 = @arrayed[0]
    if @arrayed[1] > @arrayed[3]
      char2 = @arrayed[3].to_i + 1
    else
      char2 = @arrayed[1].to_i + 1
    end
    @synthesized_point = (char1 + char2.to_s)
  end

  def synthesize_a_vertical_ships_coordinate(input)
    @arrayed = input.chars
    char2 = @arrayed[1]
    if @arrayed[0] > @arrayed[2]
      char1 = @arrayed[2].next
    else
      char1 = @arrayed[0].next
    end
    @synthesized_point = (char1 + char2.to_s)
  end

  def battleship_coordinates_writer

    @battleship_coordinates << (@arrayed[0] + @arrayed[1])
    @battleship_coordinates << @synthesized_point
    @battleship_coordinates << (@arrayed[2] + @arrayed[3])
    @battleship_coordinates


  end

  def overlap?(input)
    input.all? do |coordinate|
      @player_boat_board.empty_board[coordinate] == coordinate
    end
  end


  def coordinate_to_board_pusher(array_of_coordinates, thing_to_go_there)


    array_of_coordinates.each do |coordinate|
      @player_boat_board.empty_board[coordinate] = thing_to_go_there
    end
    @player_boat_board.update_board
  end
end
