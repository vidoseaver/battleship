require "terminal-table"
require "pry"

class Board

  attr_reader  :alternate_board, :empty_board

  def initialize
    @alternate_board = [[" "," 1"," 2"," 3"," 4"],
                        ["A","a1","a2","a3","a4"],
                        ["B","b1","b2","b3","b4"],
                        ["C","c1","c2","c3","c4"],
                        ["D","d1","d2","d3","d4"]]
    @empty_board =      {"a1"=>"empty","a2"=>"empty","a3"=>"empty","a4"=>"empty",
                         "b1"=>"empty","b2"=>"empty","b3"=>"empty","b4"=>"empty",
                         "c1"=>"empty","c2"=>"empty","c3"=>"empty","c4"=>"empty",
                         "d1"=>"empty","d2"=>"empty","d3"=>"empty","d4"=>"empty"}
  end


  def print_board(title)

     rows = []
     rows << @alternate_board[0]
     rows << :separator
     rows << @alternate_board[1]
     rows << :separator
     rows << @alternate_board[2]
     rows << :separator
     rows << @alternate_board[3]
     rows << :separator
     rows << @alternate_board[4]
     table = Terminal::Table.new :title => "#{title}",:rows => rows
     puts table
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
    empty_board.keys.any? do |key|
       key == first_point
    end
  end

  def is_the_second_valid?(input)
    input.downcase.chars
    second_point = input[2]+input[3]
    empty_board.keys.any? do |key|
       key == second_point
    end
  end

  def are_they_congruent?(input)
    arrayed = input.chars

    if arrayed[0] == arrayed[2] && (arrayed[1].to_i - arrayed[3].to_i).abs == 1
      true
    elsif arrayed[1] == arrayed[3] && (arrayed[0].ord - arrayed[2].ord).abs == 1
      true
    else
      false
    end
  end
end
