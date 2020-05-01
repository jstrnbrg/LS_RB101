# iterations = 5
#
# iterations.times do |x|
#   puts "Number of iterations = #{x + 1}"
# end
#
# loop do
#   puts 'Should I stop looping?'
#   answer = gets.chomp
#   if answer == 'yes'
#     break
#   end
# end


say_hello = true
count = 0

# while say_hello
#   puts 'Hello!'
#   count += 1
#   if count == 5
#     say_hello = false
#   end
# end

# numbers = []
#
# while numbers.size < 5
#   numbers.push(rand(0..99))
# end
#
# puts numbers

#numbers = [7, 9, 13, 25, 18]

#
# for i in 1..100
#   puts i if i % 2 != 0
# end

# friends = ['Sarah', 'John', 'Hannah', 'Dave']
#
# friends.each {|friend|
#   puts "Hello, #{friend}"
# }


# count = 1
#
# loop do
#   puts "#{count} is odd" if count.odd?
#   puts "#{count} is even" if count.even?
#   count += 1
#   break if count > 5
# end


# loop do
#   number = rand(100)
#   puts number
#   if number >= 0 && number <= 10
#     break
#   end
# end
# process_the_loop = [true, false].sample
#
# if process_the_loop
#   loop do
#     puts "The loop was processed!"
#     break
#   end
# else
#   puts "The loop wasn't processed!"
# end


# loop do
#   puts 'What does 2 + 2 equal?'
#   answer = gets.chomp.to_i
#   if answer == 4
#     puts "That's right!"
#     break
#   else
#     puts "Wrong answer. Try again!"
#   end
# end

# numbers = []
#
# until numbers.length == 5
#   puts 'Enter any number:'
#   numbers << gets.chomp.to_i
# end
# puts numbers

# names = ['Sally', 'Joe', 'Lisa', 'Henry']
#
# loop do
#   puts names.pop
#   break if names.length == 0
# end

# 5.times do |index|
#   puts index
#   break if index == 2
# end

#
# number = 0
#
# until number == 10
#   number += 1
#   next if number.odd?
#   puts number
# end

# number_a = 0
# number_b = 0
#
# loop do
#   number_a += rand(2)
#   number_b += rand(2)
#   next if number_a < 5 || number_b < 5
#   puts "5 was reached!"
#   break
# end


def greeting
  puts 'Hello!'
end

number_of_greetings = 2

while number_of_greetings > 0
  greeting
  number_of_greetings -= 1
end
