# Build a program that randomly generates and prints Teddy's age.
# To get the age, you should generate a random number between 20 and 200.
puts "Teddy is #{rand(20..200)} years old"



# Build a program that asks a user for the length and width of a room in meters
# and then displays the area of the room in both square meters and square feet.
# SQMETERS_TO_SQFEET = 10.7639
#
# puts '==> Enter the length of the room in meters: '
# length = gets.to_f
# puts '==> Enter the width of the room in meters: '
# width = gets.to_f
# square_meters = length * width
# puts "The area of the room is #{square_meters} square meters (#{square_meters * SQMETERS_TO_SQFEET} square feet)"


# Create a simple tip calculator. The program should prompt for a bill amount
# and a tip rate. The program must compute the tip and then display both the tip
# and the total amount of the bill.
# puts '==> Enter the bill amount: '
# amount = gets.to_f
# puts '==> Enter the tip in % e.g. 10 '
# tip = gets.to_f
# puts "The tip is #{amount * (tip/100)}"
# puts "The bill is #{amount + amount * (tip/100)}"

# Build a program that displays when the user will retire and how many years she
# has to work till retirement.
# YEAR = Time.now.year
#
# puts '==> What is your age? '
# age = gets.to_f
# puts '==> At what age do you want to retire? '
# retirement_age = gets.to_f
# years_to_work = retirement_age - age
# puts "It is #{YEAR}. You will retire in #{YEAR + years_to_work}"
# puts "You only have #{years_to_work} left to work!"

# Write a program that will ask for user's name.
# The program will then greet the user.
# If the user writes "name!" then the computer yells back to the user.
# puts '==> What is your name? '
# name = gets.chomp
# puts name.include?("!") ? "HELLO #{name.upcase}" :  "Hello #{name}"





# Print all odd numbers from 1 to 99, inclusive.
# All numbers should be printed on separate lines.
# (1..99).each {|x| puts x if x.odd?}
# (1..99).select {|x| x.odd?}.each {|i| puts i}


# Print the even numbers from 1 to 99, inclusive.
# All numbers should be printed on separate lines.
# (1..99).each {|x| puts x if x.even?}


# Write a program that asks the user to enter an integer greater than 0,
# then asks if the user wants to determine the sum or product of all numbers
# between 1 and the entered integer.
puts "Enter an integer greater 0: "
int = gets.chomp.to_i
puts "Do you want to calculate the sum (+) or product (*) of all numbers between 0 and #{int}? enter + or *"
sym  = gets.chomp
if sym == "+"
  puts (1..int).reduce(:+)
elsif sym == "*"
  puts (1..int).reduce(:*) 
end
