# 5. Write a method that takes one argument, a string, and returns a new string
# with the words in reverse order.

def reverse_sentence(strz)
  strz.split.reverse.join(' ') # .split makes array with words in quotes, .reverse (this version) only works on arrays, .join turns arrays to strings -- couldn't be more perfect
end # can't figure out how to add .inspect

puts reverse_sentence('Hello World') == 'World Hello'
puts reverse_sentence('Reverse these words') == 'words these Reverse'
puts reverse_sentence('') == ''
puts reverse_sentence('    ') == '' # Any number of spaces results in ''