# frozen_string_literal: true

require_relative 'lib/codemaker'
require_relative 'lib/pegs'
require_relative 'lib/game'

# Collect all information for one game
class Mastermind
  attr_accessor :game

  def initialize
    @game = Game.new
    @turn = 0
    @max_turns = 10
    @solved = false
  end

  def play
    puts 'Welcome to Mastermind!'
    puts 'Generating a code...'
    while @turn < @max_turns && !@solved
      @solved = @game.make_guess
      @turn += 1
    end
    puts 'Better luck next time...' if @turn == @max_turns
  end
end

game = Mastermind.new
# p game1.game.code
game.play
