#Q1
# string = "The Flintstones Rock!"
# spaces = ""
#
# 10.times { |number| puts (" " * number) + string }

#Q2
#puts "the value of 40 + 2 is " + (40 + 2) # can't concatenate string and integer
# puts "the value of 40 + 2 is " + (40 + 2).to_s #or
# puts "the value of 40 + 2 is #{40 + 2}"

#Q3
# def factors(number)
#   divisor = number
#   factors = []
#   while divisor > 0
#     factors << number / divisor if number % divisor == 0
#     divisor -= 1
#   end
#   factors
# end
#
# p factors(-2)

#Bonus 1: Only factors can divide number with a rest of 0
#Bonus 2: returns factors array, without the method would return nil

#Q4

#Q5
limit = 15

def fib(first_num, second_num, limit)
  while first_num + second_num < limit
    sum = first_num + second_num
    first_num = second_num
    second_num = sum
  end
  sum
end

result = fib(0, 1, limit)
puts "result is #{result}"
#Q6
# 34

#Q7
# mutated

#Q8
# paper

#Q9
# no
