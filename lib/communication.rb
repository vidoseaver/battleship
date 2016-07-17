require "./lib/rules"
require "./lib/player"
require "pry"

class Communication


  def start
    puts "Welcome to BATTLESHIP \n\nWould you like to (p)lay, read the (i)nstructions, or (q)uit?"
    @start_answer = gets.chomp.to_s
    start_answer_interpreter
  end

  def start_answer_interpreter
    if @start_answer == "p" || @start_answer == "P"
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
       puts "#{@player}, I'm going to destroy you. pun indended"
    end
end
