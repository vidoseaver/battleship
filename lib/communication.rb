require "./lib/player"
require "pry"

class Communication

  def initialize
    @player = Player.new
  end

  def start
    puts "Welcome to BATTLESHIP \n\nWould you like to (p)lay, read the (i)nstructions, or (q)uit?"
    @start_answer = gets.chomp.to_s.downcase
  end

  def start_answer_interpreter
    if @start_answer == "p"
      puts "Alright, lets start by getting your name"
      @player = @player.set_name
    elsif @start_answer == "i"
      rules1 = Rules.new
      puts rules1.instructions
      @start_answer = gets.chomp.to_s
      start_answer_interpreter
    elsif @start_answer == "q"
      return
    else
      start
    end
  end

    def shit_talk_1
       "I'm going to destroyer you. pun indended"
    end

    def ship_placement
      "I have laid out my ships on the grid.
    You now need to layout your two ships.
    The first is two units long and the
    second is three units long.
    The grid has A1 at the top left and D4 at the bottom right.\n\n

    Enter the squares for the two-unit ship:"
    end

    def wrong_coordinate_format
      "You're doing it wrong stupid. Try the following format:\n
    a1, a2. Note the space AND the comma. It goes without saying\n
    both points need to be on the map and diagonals don't count.\n
    Stop trying to cheat and try again!"
    end


    def ship_placement_rule_one
      "Ships must be fully on the board"
    end

    def ship_placement_rule_two
      "Ships cannot overlap"
    end

    def ship_placement_rule_three
      "Ships can be laid either horizontally or vertically"
    end
    def instructions
      "Welcome to battleship!\n
  The goal of the game is sink my ships before I sink yours.
  First I will ask you to place your ships. You get one destroyers(two spaces)
  and one battleship(3 spaces). Ships must be horizontal or vertical
  and fully within the grid (four by four). You place your ship by stating
  the starting and ending coordinates seperated by a comma. Like so: a1,a2.
  You get one shot per round: you fire when prompted by selecting your coordinate
  to fire upon and pressing enter. Like so: a1. I will tell you if its a hit or miss.
  You will lose because I am cheating! Muahahahahaa\n
  Would you like to (p)lay, or (q)uit?"
    end

    def coordinate_not_on_the_board
      "Your cordinate(s) were not on the board"
    end


end
