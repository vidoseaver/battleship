gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/ship.rb'

class ShipTest < MiniTest::Test

  def destroyer_placer
    ship = Ship.new
    assert_equal "array of coordinates", ship.destroyer_placer
  end

end
