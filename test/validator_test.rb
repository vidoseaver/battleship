gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/ships'
require './lib/validator'


class ValidatorTest < MiniTest::Test
  def setup
    @valid = Validator.new
    @ship = Ship.new
  end



  def test_user_input_6
    assert_equal true, @valid.user_input_6?("a1, a2")
  end

  def test_proper_format?

    assert_equal true, @valid.proper_format?("a1, a2")
  end

  def test_input_cleaner

    assert_equal "a1a2", @valid.input_cleaner("a1, a2")

  end



  def test_are_both_coordinates_valid?
    assert_equal true, @valid.are_the_coordinates_valid?("a1a2")
    assert_equal false, @valid.are_the_coordinates_valid?("a1a5")
  end


  def test_destroyer_congruent?
    assert_equal true, @valid.destroyer_congruent?("a1a2")
    assert_equal true, @valid.destroyer_congruent?("a1b1")
    assert_equal true, @valid.destroyer_congruent?("b1a1")
    assert_equal true, @valid.destroyer_congruent?("d3c3")
    assert_equal false, @valid.destroyer_congruent?("a1a1")
    assert_equal false, @valid.destroyer_congruent?("a1d1")
    assert_equal false, @valid.destroyer_congruent?("a1d5")
  end



  def test_battleship_congruent?

    assert_equal true, @valid.battleship_congruent?("a1a3")
    assert_equal true, @valid.battleship_congruent?("a1c1")
    assert_equal true, @valid.battleship_congruent?("c1a1")
    assert_equal true, @valid.battleship_congruent?("d3b3")
    assert_equal false, @valid.battleship_congruent?("a1a1")
    assert_equal false, @valid.battleship_congruent?("a1d1")
    assert_equal false, @valid.battleship_congruent?("a1d5")
  end

  def test_its_horizontal?
    assert_equal true, @ship.horizontal?("a1a3")
    assert_equal true, @ship.horizontal?("d4d2")
    assert_equal false, @ship.horizontal?("a1d3")
    assert_equal false, @ship.horizontal?("a1c1")
  end

  def test_its_vertical?
    assert_equal true, @ship.vertical?("a1c1")
    assert_equal true, @ship.vertical?("d4b4")
    assert_equal false, @ship.vertical?("a2d3")
    assert_equal false, @ship.vertical?("d1a2")
  end

  def test_it_can_synthesize_a_horizontal_ships_coordinate
    assert_equal "a2", @ship.synthesize_a_horizontal_ships_coordinate("a1a3")
    assert_equal "d3", @ship.synthesize_a_horizontal_ships_coordinate("d4d2")
  end

  def test_it_can_synthesize_a_vertical_ships_coordinate
    assert_equal "b1", @ship.synthesize_a_vertical_ships_coordinate("a1c1")
    assert_equal "c4", @ship.synthesize_a_vertical_ships_coordinate("d4b4")
  end

  def test_the_battleship_and_the_destroyer_overlap?
    ship = Ship.new
    player_ship_board = Board.new
    ship.destroyer_coordinates_writer("a1b1")
    ship.coordinate_to_board_pusher(ship.destroyer_coordinates,"d" )
    ship.synthesize_a_vertical_ships_coordinate("a1c1")
    ship.battleship_coordinates_writer

    assert_equal false, ship.overlap?(ship.battleship_coordinates_writer)

    ship2 = Ship.new
    player_ship_board = Board.new
    ship2.destroyer_coordinates_writer("a1b1")
    ship2.coordinate_to_board_pusher(ship2.destroyer_coordinates,"d" )
    ship2.synthesize_a_vertical_ships_coordinate("a3c3")
    ship2.battleship_coordinates_writer

    assert_equal true, ship2.overlap?(ship2.battleship_coordinates_writer)
  end
end
