# frozen_string_literal: true

require_relative 'lib/codemaker'
require_relative 'lib/pegs'

# Store game metadata information
class Game
  attr_accessor :turn, :code

  def initialize
    @code = Codemaker.new_code
  end

  def make_guess
    puts 'Take a guess: '
    guess = gets.chomp

    full_pegs = CorrectPegs.full(guess, code)
    partial_pegs = CorrectPegs.partial(guess, code)

    puts "Correct numbers with correct placement: #{full_pegs}"
    puts "Correct numbers with wrong placement: #{partial_pegs - full_pegs}."
  end
end

# Collect all information for one game
class Mastermind
  def initialize
    @turn = 0
    @game = Game.new
  end

  def gameplay
    while @turn < 10
      @game.make_guess
      @turn += 1
    end
  end
end

game1 = Mastermind.new
game1.gameplay
