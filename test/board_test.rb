gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/board.rb'

class BoardTest < MiniTest::Test

  def setup
    @board = Board.new
  end

  def test_empty_board
    assert_equal "empty", @board.empty_board["a1"]
  end

  def test_alternate_board
    alt_test = Board.new

    assert_equal "a1", @board.alternate_board[1][1]
  end

  def test_user_input_6
    assert_equal true, @board.user_input_6?("a1, a2")
  end

  def test_proper_format?

    assert_equal true, @board.proper_format?("a1, a2")
  end

  def test_input_cleaner

    assert_equal "a1a2", @board.input_cleaner("a1, a2")

  end

  def test_is_the_first_valid?

    assert_equal true, @board.is_the_first_valid?("a1a2")
    assert_equal false, @board.is_the_first_valid?("a5a2")
  end

  def test_is_the_second_valid?

    assert_equal true, @board.is_the_second_valid?("a1a2")
    assert_equal false, @board.is_the_second_valid?("a1a5")
  end

  def test_are_they_congruent?

    assert_equal true, @board.are_they_congruent?("a1a2")
    assert_equal true, @board.are_they_congruent?("a1b1")
    assert_equal true, @board.are_they_congruent?("b1a1")
    assert_equal true, @board.are_they_congruent?("d3c3")
    assert_equal false, @board.are_they_congruent?("a1a1")
    assert_equal false, @board.are_they_congruent?("a1d1")
    assert_equal false, @board.are_they_congruent?("a1d5")

  end


end
