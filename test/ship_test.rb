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

  def test_alignment
    
  end

  #
  # def destroyer_placer
  #   destroyer = Ship.new
  #   assert_equal "array of coordinates", ship.destroyer_placer
  # end

end
