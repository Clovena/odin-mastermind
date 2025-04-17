# frozen_string_literal: true

# Provide information on guesses
module CorrectPegs
  def self.full(input, solution)
    results = 0
    input.split('').each_with_index do |n, i|
      results += 1 if n == solution[i]
    end
    results
  end

  def self.partial(input, solution)
    results = 0
    input.split('').each do |n|
      results += 1 if solution.include?(n)
    end
    results
  end
end
