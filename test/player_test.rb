gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/player.rb'

class PlayerTest < MiniTest::Test
  def setup
    @player = Player.new
  end

  def test_player_name

    assert_equal @player.name, @player.name
  end

  def test_first_ship_coordinates_changer

    assert_equal @player.first_ship_coordinates, @player.first_ship_coordinates
  end


end
