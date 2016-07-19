gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/rules.rb'

class RulesTest < MiniTest::Test

  def test_instructions
    rulesTest1 = Rules.new

    assertion =     "Welcome to battleship!\n
The goal of the game is sink my ships before I sink yours.\n
First I will ask you to place your ships. You get one destroyers(two spaces)\n
and one battleship(3 spaces). Ships must be horizontal or vertical\n
and fully within the grid (four by four). You place your ship by stating\n
the starting and ending coordinates seperated by a comma. Like so: a1,a2.\n
You get one shot per round: you fire when prompted by selecting your coordinate\n
to fire upon and pressing enter. Like so: a1. I will tell you if its a hit or miss.\n
You will lose because I am cheating! Muahahahahaa
Would you like to (p)lay, or (q)uit?"

    assert_equal assertion, rulesTest1.instructions
  end

  def test_cordinate_not_on_the_board
    rulesTest1 = Rules.new

    assertion = "Your cordinate(s) were not on the board"

    assert_equal assertion, rulesTest1.coordinate_not_on_the_board
  end
end
