require "terminal-table"
require "pry"

class Board
  attr_reader   :board
  attr_accessor :empty_board

  def initialize
    @empty_board =     {"a1"=>"a1", "a2"=>"a2", "a3"=>"a3", "a4"=>"a4",
                        "b1"=>"b1", "b2"=>"b2", "b3"=>"b3", "b4"=>"b4",
                        "c1"=>"c1", "c2"=>"c2", "c3"=>"c3", "c4"=>"c4",
                        "d1"=>"d1", "d2"=>"d2", "d3"=>"d3", "d4"=>"d4"}
    update_board

  end

  def update_board
    @board = [[" "," 1"," 2"," 3"," 4"],
             ["A","#{@empty_board["a1"]}","#{@empty_board["a2"]}","#{@empty_board["a3"]}","#{@empty_board["a4"]}"],
             ["B","#{@empty_board["b1"]}","#{@empty_board["b2"]}","#{@empty_board["b3"]}","#{@empty_board["b4"]}"],
             ["C","#{@empty_board["c1"]}","#{@empty_board["c2"]}","#{@empty_board["c3"]}","#{@empty_board["c4"]}"],
             ["D","#{@empty_board["d1"]}","#{@empty_board["d2"]}","#{@empty_board["d3"]}","#{@empty_board["d4"]}"]]
  end

  def print_board(title)
     update_board
     rows = []
     rows << @board[0]
     rows << :separator
     rows << @board[1]
     rows << :separator
     rows << @board[2]
     rows << :separator
     rows << @board[3]
     rows << :separator
     rows << @board[4]
     table = Terminal::Table.new :title => "#{title}",:rows => rows
     puts table
     "it looks sick, thank you"
  end

end
#
# thing = Board.new
# thing.print_board("Baddass_Board")
