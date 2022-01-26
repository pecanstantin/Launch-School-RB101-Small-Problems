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