gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/communication.rb'
require "./lib/player"
require "./lib/rules"

class CommunicationTest < MiniTest::Test

  def test_start
    skip
    communication = Communication.new

    assert_equal "p", communication.start
  end

  def test_start_answer_interpreter
    skip
    communication = Communication.new


    assertion_for_p ="alright, lets start by getting your name"


    assert_equal assertion_for_p, communication.start
  end

  def test_shit_talk_1
    communication = Communication.new

    assert_equal  "#{@player}, I'm going to destroy you. pun indended", communication.shit_talk_1
  end


end
