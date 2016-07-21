require "./lib/player"
require "./lib/board"

class Validator

  def initialize
    @board = Board.new
    @horizontal = false
    @vertical = false
  end


  def user_input_6?(input)
    input.chars.length == 6
  end

  def proper_format?(input)
    user_input_6?(input) && input.chars[2]+input.chars[3] == ", "
  end

  def input_cleaner(input)
    input[0]+input[1]+input[-2]+input[-1]
  end

  def is_the_coordinates_valid?(input)
    coordinates = input.scan(/../)
    @board.empty_board.keys.any? do |key|
       key == coordinates[0]
    end
  end

  def is_the_second_coordinate_valid?(input)
    coordinates = input.scan(/../)
    @board.empty_board.keys.any? do |key|
       key == coordinates[1]
    end
  end

  def are_the_coordinates_valid?(input)
    is_the_coordinates_valid?(input) && is_the_second_coordinate_valid?(input)
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

  def battleship_congruent?(input)
      @arrayed = input
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



  def overlap?(input)
    input.all? do |coordinate|
      @board.empty_board[coordinate] == coordinate
    end
  end
end
