# 7. Write a method that takes one argument, a positive integer, and returns a
# string of alternating 1s and 0s, always starting with 1. The length of the
# string should match the given integer.

def stringy(int)
  numbers = []
  
  int.times do |index| # .times starts counting from 0
    number = index.even? ? 1 : 0 # is it even? print 1. if not, 0
    numbers << number
  end

  numbers.join # again, it was an array, after .join a string
end
# this didn't /ensure/ that there is a positive integer, tho. puts nothing if a negative integer

puts stringy(6) == '101010'
puts stringy(9) == '101010101'
puts stringy(4) == '1010'
puts stringy(7) == '1010101'


# Modify stringy so it takes an additional optional argument that defaults to 1.
# If the method is called with this argument set to 0, the method should return
# a String of alternating 0s and 1s, but starting with 0 instead of 1.

def stringy(int, zoro = 1)
  numbers = []

  int.times do |index|
    if zoro == 1
    number = index.even? ? 1 : 0
    numbers << number
    elsif zoro == 0
    number = index.even? ? 0 : 1
    numbers << number
    end
  end

  numbers.join
end # figured this out, at least

puts stringy(6, 0) == '101010'
puts stringy(9, 1) == '101010101'
puts stringy(4, 0) == '1010'
puts stringy(7) == '1010101'