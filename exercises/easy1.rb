# Write a method that takes two arguments, a string and a positive integer,
# and prints the string as many times as the integer indicates.

def string_times(str, n)
  n.times {puts str}
end

#string_times("test", 5)



# Write a method that takes one integer argument, which may be positive, negative,
# or zero. This method returns true if the number's absolute value is odd.
# You may assume that the argument is a valid integer value.

def is_odd?(int)
  int.abs % 2 != 0
end

#p is_odd?(0)


# Write a method that takes one argument, a positive integer, and returns a list
# of the digits in the number.

# rubyist style
def split_into_digits(int)
  int.to_s.split("").map {|x| x.to_i }
end

# raw style
def digit_list(number)
  digits = []
  loop do
    number, remainder = number.divmod(10) #divmod returns [result, remainder]
    digits.unshift(remainder) #unshift appends to front of array
    break if number == 0
  end
  digits
end

#p split_into_digits(2345242)
#digit_list(23423)




# Write a method that counts the number of occurrences of each element in a given array.
vehicles = [
  'car', 'car', 'truck', 'car', 'SUV', 'truck',
  'motorcycle', 'motorcycle', 'car', 'truck'
]

def count_vehicles(veh)
  result = {}
  veh.each do |item|
    if result.keys.include?(item)
      result[item] += 1
    else
      result[item] = 1
    end
  end
  result.each do |element, count|
    puts "#{element} => #{count}"
  end
end

count_vehicles(vehicles)



# Write a method that takes one argument, a string, and returns a new string with
# the words in reverse order.
def reverse_sentence(string)
  result = []
  string.split.each {|w| result.unshift(w)}
  result.join(" ")
end

p reverse_sentence("This is a test")




# Write a method that takes one argument, a string containing one or more words,
# and returns the given string with words that contain five or more characters
# reversed. Each string will consist of only letters and spaces.
# Spaces should be included only when more than one word is present.

def reverse_longer_four_char(string)
  result = []
  string.split.each do |w|
    if w.size >= 5
      result << w.reverse
    else
      result << w
    end
  end
  result.join(" ")
end

p reverse_longer_four_char('Walk around the block')



# Write a method that takes one argument, a positive integer, and returns a
# string of alternating 1s and 0s, always starting with 1.
# The length of the string should match the given integer.

# Modify stringy so it takes an additional optional argument that defaults to 1.
# If the method is called with this argument set to 0, the method should return a String of alternating 0s and 1s, but starting with 0 instead of 1.

def stringy(int, start=1)
  result = []
  int.times do |index|
    first, second = start == 1 ? [1,0] : [0,1]
    num = index.even? ? first : second
    result << num
  end
  result.join
end

p stringy(4, 0)



# Write a method that takes one argument, an array containing integers, and
# returns the average of all numbers in the array.
# The array will never be empty and the numbers will always be positive integers.

def average(arr)
  arr.reduce(:+).to_f / arr.size
end

p average([9, 47, 23, 95, 16, 52])


# Write a method that takes one argument, a positive integer, and returns
# the sum of its digits.

def sum(int)
  int.to_s.split("").map {|i| i.to_i}.reduce(:+)
end

p sum(1234)


# Write a method that takes two arguments, a positive integer and a boolean,
# and calculates the bonus for a given salary. If the boolean is true, the bonus should be half of the salary.
# If the boolean is false, the bonus should be 0.

def bonus(salary, bool)
  bool ? salary * 0.5 : 0
end

p bonus(10000, true)
