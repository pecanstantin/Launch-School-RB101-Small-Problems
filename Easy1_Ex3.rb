# 3. Write a method that takes one argument, a positive integer, and returns
# a list of the digits in the number.

# Brute force: 
def digit_list(posint)
  digits = []
  loop do
    posint, remainder = posint.divmod(10) # so we're able to equal both posint and remainder because .divmod returns both # returns [1234, 5]
    digits.unshift(remainder) # .unshift puts given objects at beginning of array -- so the remainder 5 (and continuing) go there
    break if posint == 0 #  not sure how it ever equals 0 and not 1/10, 0.1/10, etc., but ok
  end
  digits
end

puts digit_list(12345).inspect

# Idiomatic Ruby:
def digit_list2(posint)
  posint.to_s.chars.map(&:to_i) # .chars makes the array (only works with Strings); .map and (&:to_i) are connected -- it makes it integers again
end