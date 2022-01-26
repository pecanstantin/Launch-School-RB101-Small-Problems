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