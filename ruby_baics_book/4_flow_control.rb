x = 2

# Example 1
if x == 3
  puts "x is 3"
end

# Example 2
if x == 3
  puts "x is 3"
elsif x == 4
  puts "x is 4"
end

# Example 3
if x == 3
  puts "x is 3"
else
  puts "x is NOT 3"
end

# Example 4: must use "then" keyword when using 1-line syntax
if x == 3 then puts "x is 3" end

# Example 1 rewritten
puts "x is 3" if x == 3

# Exemple unless
puts "x is NOT 3" unless x == 3

# Ruby follows an order of precedence when deciding how to evaluate multiple expressions. The following is a list of operations from highest order of precedence (top) to lowest (bottom).
#
# 1. <=, <, >, >= - Comparison
# 2. ==, != - Equality
# 3. && - Logical AND
# 4. || - Logical OR


# Ternary Operator
puts 4 == 4 ? "4 equals 4" :  "4 does not equal 4"

# Case statement
a = 6

case a
when 5
  puts "a is 5"
when 6
  puts "a is 6"
else
  puts "a is neither 5, nor 6"
end


# True and False
# In Ruby, every expression evaluates to true when used in flow control, except for false and nil

# Exercises
# Exercise 1
puts (32 * 4) >= 129 #false
puts false != !true #false
puts true == 4 #false
puts false == (847 == '874') #true
puts (!true || (!(100 / 5) == 20) || ((328 / 4) == 82)) || false # true


 # Exercise 2
 def uppercase_if_longer_10(input)
   if input.length > 10
     input.upcase
   else
     input
   end
end

puts uppercase_if_longer_10("this is a test")


# Exercise 3
def ask_for_number()
  puts "Input number pls: "
  number = gets.chomp.to_i
  if number < 0 || number > 100
    number = ask_for_number()
  end
  return number
end

number = ask_for_number
puts number
puts number.is_a?(Integer)

if number <= 50
  puts "number between 0 and 50"
elsif number > 50 && number <= 100
  puts "number between 51 and 100"
else
  puts "nothing"
end


# Exercise 4
'4' == 4 ? puts("TRUE") : puts("FALSE") #"FALSE"

x = 2
if ((x * 3) / 2) == (4 + 4 - x - 3)
 puts "Did you get it right?"
else
 puts "Did you?"
end
# "Did you get it right?"

y = 9
x = 10
if (x + 1) <= (y)
 puts "Alright."
elsif (x + 1) >= (y)
 puts "Alright now!"
elsif (y + 1) == x
 puts "ALRIGHT NOW!"
else
 puts "Alrighty!"
end
# "Alright now!"
