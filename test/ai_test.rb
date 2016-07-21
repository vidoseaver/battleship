gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/board'
require './lib/ships'
require './lib/ai'

class AiTest < MiniTest::Test

  def setup
    @board = Board.new
    @ai = Ai.new
  end

  def test_has_ship_board
    assert @ai.ship_board
  end

  def test_it_has_a_shot_board
    assert @ai.shots_board
  end

  def test_it_can_pick_a_coordinate
    skip
    assert_equal @board.empty_board.values.sample, @ai.it_gives_a_random_coordinate
  end

  def test_it_can_provide_two_points_ready_for_the_validator
    skip
    assert_equal "two random coordinates", @ai.two_random_coordinates
  end






end
