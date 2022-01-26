# 1. puts File.path('bin') # puts file path

# f = File.new('my-file.txt')
# puts f.path # creates new file

# 2. Doc signatures use [] to show that all of the arguments are optional. 

# Brackets are nested with this method; items inside the outermost bracket pairs 
# can only be omitted if all of the innermost bracket pairs are omitted as well.

# 3. In default positional arguments, the /last/ argument will apply to the last
# ungiven argument. 
# def my_method(a, b = 2, c = 3, d)
#   p [a, b, c, d]
# end

# my_method(4, 5, 6) # [4, 5, 3, 6]

# 4.
# a = [1, 4, 8, 11, 15, 19]

# puts a.bsearch { |x| x > 8 }

# 5.
a = %w(a b c d e)
puts a.fetch(7) 
# IndexError: index 7 outside of array bounds: -5...5
puts a.fetch(7, 'beats me')
# beats me # Returns the value of the default argument if the element doesn't exist
puts a.fetch(7) { |index| index**2 }
# 49 # Element also doesn't exist; Provided a block that returned a value.

# 6. 
5.step(to: 10, by: 3) { |value| puts value }
# 5
# 8

# 7.
s = 'abc'
puts s.public_methods(false).inspect # added false to exclude members defined in Object, BasicObject, and Kernel
# only kept String methods

# 8. 
a = [5, 9, 3, 11]
puts a.min(2) # .min docs are in Enumerable mixin, not parent Object; takes () to print number of min values

# 9. YAML is now thru Psych # https://ruby-doc.org/stdlib/libdoc/psych/rdoc/Psych.html