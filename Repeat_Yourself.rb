# 1.
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