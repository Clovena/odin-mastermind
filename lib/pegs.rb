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
    input_arr = input.split('')
    input_arr.uniq.each do |n|
      results += [input_arr.count(n), solution.count(n)].min
    end
    results
  end
end
