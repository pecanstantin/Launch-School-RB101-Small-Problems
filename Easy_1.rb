# 1. Write a method that takes two arguments, a string and a positive integer,
# and prints the string as many times as the integer indicates.

def repeat(string, number) #so here just do variables by default?
  number.times do
    puts string #ok I didn't notice it was puts repeat and the error it was giving me seemed unrelated -- rb:1:in `repeat': wrong number of arguments (given 0, expected 2) (ArgumentError)
  end
end

repeat('hi', 5)

# Matt Ellicott - Verifies the number used is a positive integer:
def repeat(str,int)
  while int.integer? && int > 0
    puts str
    int -= 1
  end
end

repeat('Hello', 5)

# 2. Write a method that takes one integer argument, which may be positive, negative, 
# or zero. This method returns true if the number's absolute value is odd. You
# may assume that the argument is a valid integer value.

# LS:
# def is_odd?(number)
#   number % 2 == 1
# end

# # me:
# def absvalue(int)
#   if int.abs % 2 == 0
#     p false
#   else
#     p true
#   end
# end

# absvalue(5)
# absvalue(6)
# absvalue(0)

# If you weren't certain whether % were the modulo or remainder operator, how
# would you rewrite #is_odd? so it worked regardless?

# The Integer#remainder method performs a remainder operation in Ruby. Rewrite
# #is_odd? to use Integer#remainder instead of %. Note: before version 2.4,
# Ruby used the Numeric#remainder method instead.

def is_odd?(int)
  int.remainder(2) != 0 # so you can put a variable before .remainer, not just a set integer
end

puts is_odd?(-15)

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


# 4. Write a method that counts the number of occurrences of each element in a
# given array. Once counted, print each element alongside the number of occurrences.

vehicles = [
  'car', 'car', 'truck', 'car', 'SUV', 'truck',
  'motorcycle', 'motorcycle', 'car', 'truck'
]

# # best:
# def count_occurrences(x)
#   x.tally
# end

# puts count_occurrences(vehicles)


# # LS:
def count_occurrences(array)
  occurrences = {}

  array.uniq.each do |element| # .uniq returns a new array without duplicate values. 
    occurrences[element] = array.count(element) # the confusion here (and bad by LS) is to name the default parameter "array". "array" is "vehicles". so for each unique string (occurences[element]), we are counting how many of that was in "array" (vehicles).
  end # with argument (element) after .count, it returns the count/amount of elements of the provided (element)
# and the "=" connects the element to the count, I guess?

  occurrences.each do |element, count|
    puts "#{element} => #{count}"
  end
end

puts count_occurrences(vehicles)


# # Neil Bost:
# def count_occurrences(array)
#   hash = array.to_h { |ele| [ele, array.count(ele)] }
#   hash.each do |k, v|
#     puts "#{k} => #{v}"
#   end
# end

# puts count_occurrences(vehicles)


# # Further exploration:
def count_occurrences(array)
  occurrences = {}

  lowercase_list = array.map {|element| element.downcase} # .map returning a downcase list, goes into variable

  unique_words_in_list = lowercase_list.uniq # making a list of uniques

  unique_words_in_list.each do |element| # no .uniq here, using uniq list
    occurrences[element] = lowercase_list.count(element) # interesting; we are working with&referring to elements from the unique array which we are not going back to
  end # and again, above it connected key to value in one go

  occurrences.each do |element, count|
    puts "#{element} => #{count}"
  end
end

puts count_occurrences(vehicles)


# 5. Write a method that takes one argument, a string, and returns a new string
# with the words in reverse order.

def reverse_sentence(strz)
  strz.split.reverse.join(' ') # .split makes array with words in quotes, .reverse (this version) only works on arrays, .join turns arrays to strings -- couldn't be more perfect
end # can't figure out how to add .inspect

puts reverse_sentence('Hello World') == 'World Hello'
puts reverse_sentence('Reverse these words') == 'words these Reverse'
puts reverse_sentence('') == ''
puts reverse_sentence('    ') == '' # Any number of spaces results in ''


# 6. Write a method that takes one argument, a string containing one or more words,
# and returns the given string with words that contain five or more characters
# reversed. Each string will consist of only letters and spaces. Spaces should
# be included only when more than one word is present.

def reverse_words(strz)
  words = []

strz.split.each do |word|
  word.reverse! if word.size >= 5 # forgot that I can use "if" in the middle
  words << word # this looks like words going into word, but it's the opposite
end

words.join(' ') # turns array back to string
end

puts reverse_words('Professional')          # => lanoisseforP
puts reverse_words('Walk around the block') # => Walk dnuora the kcolb
puts reverse_words('Launch School')         # => hcnuaL loohcS


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


