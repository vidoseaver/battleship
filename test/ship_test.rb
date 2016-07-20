gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/ships'


class ShipTest < MiniTest::Test
  def setup
    @destroyer = Ship.new
    @battleship = Ship.new
  end

  def test_destroyer_size
    assert 2, @destroyer.destroyer_size
  end

  def test_battleship_size
    assert_equal 3, @battleship.battleship_size
  end

  def test_user_input_6
    assert_equal true, @destroyer.user_input_6?("a1, a2")
  end

  def test_proper_format?

    assert_equal true, @destroyer.proper_format?("a1, a2")
  end

  def test_input_cleaner

    assert_equal "a1a2", @destroyer.input_cleaner("a1, a2")

  end

  def test_is_the_first_valid?

    assert_equal true, @destroyer.is_the_first_valid?("a1a2")
    assert_equal false, @destroyer.is_the_first_valid?("a5a2")
  end

  def test_is_the_second_valid?

    assert_equal true, @destroyer.is_the_second_valid?("a1a2")
    assert_equal false, @destroyer.is_the_second_valid?("a1a5")
  end

  def test_destroyer_congruent?
    assert_equal true, @destroyer.destroyer_congruent?("a1a2")
    assert_equal true, @destroyer.destroyer_congruent?("a1b1")
    assert_equal true, @destroyer.destroyer_congruent?("b1a1")
    assert_equal true, @destroyer.destroyer_congruent?("d3c3")
    assert_equal false, @destroyer.destroyer_congruent?("a1a1")
    assert_equal false, @destroyer.destroyer_congruent?("a1d1")
    assert_equal false, @destroyer.destroyer_congruent?("a1d5")
  end

  def test_writes_destroyer_coordinates

    destroyer1 = Ship.new
    destroyer2 = Ship.new

    destroyer1.destroyer_congruent?("a1a2")
    destroyer2.destroyer_congruent?("a1b2")

    assert_equal ["a1","a2"],destroyer1.destroyer_coordinates_writer
    assert_equal ["a1","b2"],destroyer2.destroyer_coordinates_writer
  end

  def test_battleship_congruent?

    assert_equal true, @battleship.battleship_congruent?("a1a3")
    assert_equal true, @battleship.battleship_congruent?("a1c1")
    assert_equal true, @battleship.battleship_congruent?("c1a1")
    assert_equal true, @battleship.battleship_congruent?("d3b3")
    assert_equal false, @battleship.battleship_congruent?("a1a1")
    assert_equal false, @battleship.battleship_congruent?("a1d1")
    assert_equal false, @battleship.battleship_congruent?("a1d5")
  end

  def test_its_horizontal?
    assert_equal true, @battleship.horizontal?("a1a3")
    assert_equal true, @battleship.horizontal?("d4d2")
    assert_equal false, @battleship.horizontal?("a1d3")
    assert_equal false, @battleship.horizontal?("a1c1")
  end

  def test_its_vertical?
    assert_equal true, @battleship.vertical?("a1c1")
    assert_equal true, @battleship.vertical?("d4b4")
    assert_equal false, @battleship.vertical?("a2d3")
    assert_equal false, @battleship.vertical?("d1a2")
  end

  def test_it_can_synthesize_a_horizontal_ships_coordinate
    assert_equal "a2", @battleship.synthesize_a_horizontal_ships_coordinate("a1a3")
    assert_equal "d3", @battleship.synthesize_a_horizontal_ships_coordinate("d4d2")
  end

  def test_it_can_synthesize_a_vertical_ships_coordinate
    assert_equal "b1", @battleship.synthesize_a_vertical_ships_coordinate("a1c1")
    assert_equal "c4", @battleship.synthesize_a_vertical_ships_coordinate("d4b4")
  end

  def test_writes_battleship_coordinates

    battleship1 = Ship.new
    battleship2 = Ship.new

    battleship1.synthesize_a_vertical_ships_coordinate("a1c1")
    battleship2.synthesize_a_horizontal_ships_coordinate("d4d2")

    assert_equal ["a1","b1","c1"],battleship1.battleship_coordinates_writer
    assert_equal ["d4","d3","d2"],battleship2.battleship_coordinates_writer
  end

  def test_it_writes_destroyer_coordinates_to_board
    battleship1 = Ship.new
    player_ship_board = Board.new
    battleship1.destroyer_congruent?("a1b1")
    battleship1.destroyer_coordinates_writer


    assert_equal [[" ", " 1", " 2", " 3", " 4"], ["A", "d", "a2", "a3", "a4"], ["B", "d", "b2", "b3", "b4"], ["C", "c1", "c2", "c3", "c4"], ["D", "d1", "d2", "d3", "d4"]], battleship1.coordinate_to_board_pusher(battleship1.destroyer_coordinates,"d" )
  end

  def test_the_battleship_and_the_destroyer_overlap?
    battleship1 = Ship.new
    player_ship_board = Board.new
    battleship1.destroyer_congruent?("a1b1")
    battleship1.destroyer_coordinates_writer
    battleship1.coordinate_to_board_pusher(battleship1.destroyer_coordinates,"d" )
    battleship1.synthesize_a_vertical_ships_coordinate("a1c1")
    battleship1.battleship_coordinates_writer

    assert_equal false, battleship1.overlap?(battleship1.battleship_coordinates_writer)

    battleship2 = Ship.new
    player_ship_board = Board.new
    battleship2.destroyer_congruent?("a1b1")
    battleship2.destroyer_coordinates_writer
    battleship2.coordinate_to_board_pusher(battleship2.destroyer_coordinates,"d" )
    battleship2.synthesize_a_vertical_ships_coordinate("a3c3")
    battleship2.battleship_coordinates_writer

    assert_equal true, battleship2.overlap?(battleship2.battleship_coordinates_writer)
  end

  def test_it_writes_battleship_coordinates_to_board
    battleship1 = Ship.new
    player_ship_board = Board.new
    battleship1.synthesize_a_vertical_ships_coordinate("a1c1")
    battleship1.battleship_coordinates_writer


    assert_equal [[" ", " 1", " 2", " 3", " 4"], ["A", "b", "a2", "a3", "a4"], ["B", "b", "b2", "b3", "b4"], ["C", "b", "c2", "c3", "c4"], ["D", "d1", "d2", "d3", "d4"]], battleship1.coordinate_to_board_pusher(battleship1.battleship_coordinates_writer,"b" )
  end

end
