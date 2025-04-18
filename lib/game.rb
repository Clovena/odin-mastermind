# frozen_string_literal: true

# Store game metadata information
class Game
  attr_accessor :turn, :code

  def initialize
    @code = Codemaker.new_code
  end

  def cracked(input, solution)
    input.split('') == solution
  end

  def get_pegs(input, solution)
    total_pegs = CorrectPegs.all_pegs(input, solution)
    full_correct = CorrectPegs.proper_place(input, solution)
    partial_correct = total_pegs - full_correct

    puts "Correct numbers with correct placement: #{full_correct}"
    puts "Correct numbers with wrong placement: #{partial_correct}."
  end

  def make_guess
    puts 'Take a guess: '
    guess = gets.chomp

    if cracked(guess, code)
      puts "Congratulations! You've cracked the code."
      true # Break out of turns
    else
      get_pegs(guess, code)
    end
  end
end
