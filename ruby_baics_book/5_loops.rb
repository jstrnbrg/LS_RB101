# Infinite loops
# loop {
#   puts "forever"
# }

# While loop
puts "Input number pls: "
x = gets.chomp.to_i
while x >= 0
  puts x
  x -= 1
end
puts "Done!"


# Until loop (opposite of while loop)
puts "Input number pls: "
x = gets.chomp.to_i
until x < 0
  puts x
  x -= 1
end
puts "Done!"

# Do/While loop
# Notice that we're using a simple loop, except the condition to break out of the
# loop occurs at the end, therefore ensuring that the loop executes at least once
loop do
  puts "Do you want to do that again?"
  answer = gets.chomp
  if answer != 'Y'
    break
  end
end

# For loops
# .. means including x
# ... means excluding x
puts "Input number pls: "
x = gets.chomp.to_i
for i in 1..x do
  puts i
end
puts "Done!"


x = [1, 2, 3, 4, 5]
for i in x do
  puts i
end
puts "Done!"

# next
# If you place the next reserved word in a loop, it will jump from that line to
#the next loop iteration without executing the code beneath it.

# break
# If you place the break reserved word in a loop, it will exit the loop immediately
#without executing any more code in the loop


# Iterators
# Iterators are methods that naturally loop over a given set of data and allow you
# to operate on each element in the collection.

names = ['Bob', 'Joe', 'Steve', 'Janice', 'Susan', 'Helen']
x= 1

names.each { |name| puts name } # Use {} if it fits on one line

names.each do |name| #use do/end if it needs multiple lines
  puts "#{x}. #{name}"
  x += 1
end

# Exercie 2
loop do
  puts "Tell me something: "
  input = gets.chomp.to_s
  puts "You said: #{input}"
  if input == "STOP"
    break
  end
end

# Exercise 3
def count(int)
  if int <= 0
    puts int
  else
    puts int 
    count(int - 1)
  end
end

count(7)
