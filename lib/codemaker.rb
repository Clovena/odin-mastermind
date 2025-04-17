# frozen_string_literal: true

# Generate codes
module Codemaker
  def self.new_code(int = nil)
    int = rand(0..1295) unless int.instance_of?(Integer) && int <= 1295
    code = int.to_s(6).split('')
    code.unshift('0') while code.length < 4
    code
  end
end
