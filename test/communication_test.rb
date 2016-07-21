gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/communication.rb'
require "./lib/player"
require "./lib/ships"

class CommunicationTest < MiniTest::Test

  def setup
    @communication = Communication.new
  end
  def test_start
    skip


    assert_equal "p", @communication.start
  end

  def test_start_answer_interpreter
    skip

    assertion_for_p ="alright, lets start by getting your name"


    assert_equal assertion_for_p, @communication.start
  end

  def test_shit_talk_1

    assert_equal  "I'm going to destroyer you. pun indended", @communication.shit_talk_1
  end

  def test_ship_placement
    assertion = "I have laid out my ships on the grid.
    You now need to layout your two ships.
    The first is two units long and the
    second is three units long.
    The grid has A1 at the top left and D4 at the bottom right.\n\n

    Enter the squares for the two-unit ship:"

    assert_equal assertion, @communication.ship_placement
  end

  def test_wrong_coordinate_format
    assertion = "You're doing it wrong stupid. Try the following format:\n
    a1, a2. Note the space AND the comma. It goes without saying\n
    both points need to be on the map and diagonals don't count.\n
    Stop trying to cheat and try again!"

    assert_equal assertion, @communication.wrong_coordinate_format
    end


  def test_ship_placement_rule_one
    assertion = "Ships must be fully on the board"

    assert_equal assertion, @communication.ship_placement_rule_one
  end

  def test_ship_placement_rule_two
    assertion = "Ships cannot overlap"

    assert_equal assertion, @communication.ship_placement_rule_two
  end

  def test_ship_placement_rule_three
    assertion = "Ships can be laid either horizontally or vertically"

    assert_equal assertion, @communication.ship_placement_rule_three
  end

  def test_instructions
      assertion =     "Welcome to battleship!\n
  The goal of the game is sink my ships before I sink yours.
  First I will ask you to place your ships. You get one destroyers(two spaces)
  and one battleship(3 spaces). Ships must be horizontal or vertical
  and fully within the grid (four by four). You place your ship by stating
  the starting and ending coordinates seperated by a comma. Like so: a1,a2.
  You get one shot per round: you fire when prompted by selecting your coordinate
  to fire upon and pressing enter. Like so: a1. I will tell you if its a hit or miss.
  You will lose because I am cheating! Muahahahahaa\n
  Would you like to (p)lay, or (q)uit?"

    assert_equal assertion, @communication.instructions
  end

  def test_cordinate_not_on_the_board
    assertion = "Your cordinate(s) were not on the board"

    assert_equal assertion, @communication.coordinate_not_on_the_board
  end
end
