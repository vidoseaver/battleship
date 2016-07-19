require "./lib/rules"
require "./lib/player"
require "./lib/ships"
require "pry"

class Communication


  def start
    puts "Welcome to BATTLESHIP \n\nWould you like to (p)lay, read the (i)nstructions, or (q)uit?"
    @start_answer = gets.chomp.to_s
    start_answer_interpreter
  end

  def start_answer_interpreter
    if @start_answer == "p" || @start_answer == "P"
      puts "Alright, lets start by getting your name"
      @player = Player.new
      @player = @player.name
    elsif @start_answer == "i" || @start_answer == "I"
      rules1 = Rules.new
      puts rules1.instructions
      @start_answer = gets.chomp.to_s
      start_answer_interpreter
    elsif @start_answer == "q" || @start_answer == "Q"
      return
    else
      start
    end
  end

    def shit_talk_1
       "#{@player}, I'm going to destroy you. pun indended"
    end

    def ship_placement
      "I have laid out my ships on the grid\n.
    You now need to layout your two ships.\n
    The first is two units long and the\n
    second is three units long.\n
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


end
