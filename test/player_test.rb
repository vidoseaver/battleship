gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/player.rb'

class PlayerTest < MiniTest::Test

  def test_player_name
    player1 = Player.new

    assert_equal "vido", player1.name
  end

end
