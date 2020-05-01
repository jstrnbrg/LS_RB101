# puts "Please give input: "
# input = gets.chomp
# p input


# puts "How old are you in years?"
# years = gets.chomp.to_i
# puts "You are #{years*12} months old"


# puts "Do you want me to print something? (y/n)"
# input = gets.chomp
# puts "something" if input == "y"

# loop do
#   puts "Do you want me to print something? (y/n)"
#   input = gets.chomp.downcase.to_s
#   if input == "n"
#     break
#   elsif input == "y"
#     puts "something"
#     break
#   else
#     puts "Invalid input! Please enter y or n"
#     next
#   end
# end

# loop do
#   puts "How many output lines do you want? Enter a number >= 3:"
#   number = gets.chomp.to_i
#   if number >= 3
#     number.times {puts "Launch School is the best!"}
#     break
#   else
#     puts "Not enough. At least 3 needed"
#   end
# end

# loop do
#   puts "Please enter your password:"
#   pw = gets.chomp
#   if pw == "P!WD"
#     puts "Welcome"
#     break
#   else
#     puts "Invalid Password"
#   end
# end

# loop do
#   puts "Please enter your username:"
#   user = gets.chomp
#   puts "Please enter your password:"
#   pw = gets.chomp
#   if pw == "P!WD" && user == "jonny"
#     puts "Welcome"
#     break
#   else
#     puts "autorization failed"
#   end
# end

# def valid_number?(number_string)
#   number_string.to_i.to_s == number_string
# end
#
# loop do
#   puts "Please enter the numerator:"
#   num = gets.chomp
#   puts "Please enter the denominator:"
#   den = gets.chomp
#   if valid_number?(num) && valid_number?(den) && den.to_i != 0
#     num = num.to_i
#     den = den.to_i
#     if (num.is_a? Integer) && (den.is_a? Integer)
#       puts "#{num} / #{den} = #{num/den}"
#       break
#     else
#       puts "Only integers allowd"
#     end
#   else
#     puts "Invalid input"
#   end
# end

# loop do
#   puts '>> How many output lines do you want? Enter a number >= 3:'
#   input = gets.chomp
#   lines = input.to_i
#
#   if input.downcase == "q"
#     break
#   elsif lines < 3
#     puts ">> That's not enough lines."
#     next
#   else
#     lines.times {puts "Launch School is the best!"}
#   end
# end

def valid_number?(number_string)
  number_string.to_i.to_s == number_string && number_string.to_i != 0
end

loop do
  puts "Please enter a positive or negative integer:"
  num1 = gets.chomp
  puts "Please enter a positive or negative integer:"
  num2 = gets.chomp
  if valid_number?(num1) && valid_number?(num2)
    num1 = num1.to_i
    num2 = num2.to_i
    if (num1 <= 0 && num2 >= 0) || (num1 >= 0 && num2 <= 0)
      puts "valid numbers"
      puts "#{num1} + #{num2} = #{num1 + num2}"
      break
    else
      puts "Enter one positive and one negative number!"
    end
  else
    puts "invalid"
  end
end
