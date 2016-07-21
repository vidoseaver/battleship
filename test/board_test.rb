gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/board.rb'

class BoardTest < MiniTest::Test

  def setup
    @board = Board.new
  end

  def test_empty_board
    assert_equal "a1", @board.empty_board["a1"]
  end

  def test_alternate_board
    alt_test = Board.new

    assert_equal "a1", @board.board[1][1]
  end
  def test_it_prints_a_dope_ass_board
    assert_equal "it looks sick, thank you", @board.print_board("badass board")
  end

end
