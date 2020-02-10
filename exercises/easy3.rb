# Write a program that solicits 6 numbers from the user,
# then prints a message that describes whether or not the 6th number appears amongst the first 5 numbers.

# numbers = []
#
# puts "Enter the 1st number:"
# numbers << gets.chomp.to_i
# puts "Enter the 2nd number:"
# numbers << gets.chomp.to_i
# puts "Enter the 3rd number:"
# numbers << gets.chomp.to_i
# puts "Enter the 4th number:"
# numbers << gets.chomp.to_i
# puts "Enter the 5th number:"
# numbers << gets.chomp.to_i
# puts "Enter the last number:"
# last_number = gets.chomp.to_i
#
# if numbers.include? last_number
#   puts "The number #{last_number} appears in #{numbers}."
# else
#   puts "The number #{last_number} does not appear in #{numbers}."
# end


# Write a program that prompts the user for two positive integers, and then
# prints the results of the following operations on those two numbers:
# addition, subtraction, product, quotient, remainder, and power.
# Do not worry about validating the input.

# puts "==> Enter the first number: "
# num1 = gets.chomp.to_i
# puts "==> Enter the second number: "
# num2 = gets.chomp.to_i
# puts "==> #{num1} + #{num2} = #{num1 + num2}"
# puts "==> #{num1} - #{num2} = #{num1 - num2}"
# puts "==> #{num1} * #{num2} = #{num1 * num2}"
# puts "==> #{num1} / #{num2} = #{num1 / num2}"
# puts "==> #{num1} % #{num2} = #{num1 % num2}"
# puts "==> #{num1} ** #{num2} = #{num1 ** num2}"


# Write a program that will ask a user for an input of a word or multiple words
# and give back the number of characters. Spaces should not be counted as a character.
# puts "==> Enter one or multiple words:  "
# original = gets.chomp
# stripped = original.gsub(/\s+/, "")
# puts "There are #{stripped.size} characters in #{original}."

# Create a method that takes two arguments, multiplies them together, and returns the result.
def multiply(a, b)
  a * b
end
#p multiply(10,8)

# Using the multiply method from the "Multiplying Two Numbers" problem,
# write a method that computes the square of its argument (the square is the
# result of multiplying a number by itself).
def square(n)
  multiply(n,n)
end
#p square(6)

# What if we wanted to generalize this method to a "power to the n" type method:
# cubed, to the 4th power, to the 5th, etc.
# How would we go about doing so while still using the multiply method?
# def power(base, power)
#   if power == 0
#     return 1
#   else
#     return multiply(base, power(base, power - 1))
#   end
# end
# p power(6, 3)

# Write an xor() method that returns true if only one of the inputs is truthy
# and false if either none or both of the inputs are truthy.
def xor(a, b)
  (a || b) && !(a && b)
end

p xor(true,false)


# Write a method that returns an Array that contains every other element of an
# Array that is passed in as an argument.
# The values in the returned list should be those values that are in the 1st,
# 3rd, 5th, and so on elements of the argument Array.
def oddities(arr)
  arr.select.with_index {|val, index| index.even?}
end

p oddities([10,9,8])


# Write a method that returns true if the string passed as an argument is a palindrome,
# false otherwise. A palindrome reads the same forward and backward.
# For this exercise, case matters as does punctuation and spaces.
def palindrome?(string)
  string == string.reverse
end

p palindrome?('madam')
p palindrome?("madam i'm adam")
p palindrome?('356653')
