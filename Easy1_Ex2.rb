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
