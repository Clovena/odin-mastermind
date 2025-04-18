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

    total_pegs = CorrectPegs.all_pegs(guess, code)
    full_correct = CorrectPegs.proper_place(guess, code)
    partial_correct = total_pegs - full_correct

    puts "Correct numbers with correct placement: #{full_correct}"
    puts "Correct numbers with wrong placement: #{partial_correct}."
  end
end

# Collect all information for one game
class Mastermind
  attr_accessor :game

  def initialize
    @turn = 0
    @game = Game.new
  end

  def gameplay
    while @turn < 5
      @game.make_guess
      @turn += 1
    end
  end
end

game1 = Mastermind.new
p game1.game.code
game1.gameplay
