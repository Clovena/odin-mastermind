# frozen_string_literal: true

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

  def self.cracked(input, solution)
    input == solution
  end
end
