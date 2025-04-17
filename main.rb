# frozen_string_literal: true

# Pseudocode
#
# Begin by randomly generating a four-character sequence
# comprised of six possible colors.
# Represent colors as numbers, 0-5 (0, 1, 2, 3, 4, 5)
#
# So: generate four digit number in base 6, basically
# Generation process:
#   Random number(10) between 0 and 1295 (which is 5555 in base-6)
#   Convert that number to base-6, then string (making sure to zero-fill), then split
#   Result is Array of length 4 with each element as a numeric character

def rand_code
  code = rand(0..1295).to_s(6).split('')
  code.unshift('0') while code.length < 4
  code
end
