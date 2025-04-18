# frozen_string_literal: true

# Provide information on guesses
module CorrectPegs
  def self.arr_to_hash(arr)
    arr.each_with_object(Hash.new(0)) do |vote, result|
      result[vote] += 1
    end
  end

  def self.all_pegs(input, solution)
    results = 0
    input_hash = arr_to_hash(input.split(''))
    solution_hash = arr_to_hash(solution)

    input_hash.each_pair do |key, value|
      results += [solution_hash[key], value].min
    end
    results
  end

  def self.proper_place(input, solution)
    results = 0
    input.split('').each_with_index do |n, i|
      results += 1 if n == solution[i]
    end
    results
  end
end
